<?php
define('DS', DIRECTORY_SEPARATOR);

// Get the authentication credentials
$authfile = '/var/www/v2.lokalepolitie.be/private/db.auth';
if(!file_exists($authfile)) {
    exit('Could not find MySQL credentials ('.$authfile.')');
}

$config = new stdClass;

$contents   = trim(file_get_contents($authfile));
$values     = explode(':', $contents);

$config->user = $values[0];
$config->password = implode('', array_slice($values, 1));

// Create the daily dumps
$backup = new Backup('/var/backups/');
$backup->dumpDatabases($config);

// Clean-up old backups
$backup->cleanup('databases'.DS.'daily', 31); // remove dumps older than 31 days

/**
 * Backup class
 *
 */
class Backup
{
    /**
     * @var string	base path of the stored and rotated backups
     */
    protected $_backup_directory;

    public function __construct()
    {
        if(func_num_args())	{
            $this->_backup_directory = func_get_arg(0);
        }
    }

    /**
     * Creates a MySQL dump file of all databases
     *
     * @param string $filename	name of dump output file
     * @return string the full path to the backup file
     */
    public function dumpDatabases($config)
    {
        $username = $config->user;
        $password = $config->password;

        $filename = 'databases'.DS.'daily'.DS.'platform.'.date('Ymd').'.sql.tar';
        $filename = $this->_getPath($filename);

        // Get a list of all the databases
        $cmd = 'mysql -u'.escapeshellarg($username).' -p'.escapeshellarg($password);
        $cmd .= ' --raw --skip-column-names -e "SHOW DATABASES LIKE \'____\';"';

        exec($cmd, $databases);

        foreach($databases as $key => $database)
        {
            if(in_array($database, array('demo'))) {
                unset($databases[$key]);
            }
        }

        // Create an empty tarball
        exec('tar -cvf '.$filename.' --files-from /dev/null');

        // Now add each database dump into the tarball
        $tmp = DS.'tmp'.DS.uniqid().DS;
        mkdir($tmp);

        foreach($databases as $database)
        {
            $destination = $tmp.$database.'.sql';

            $cmd = 'mysqldump --complete-insert --add-drop-table --extended-insert --quote-names';
            $cmd .= ' -u'.escapeshellarg($username).' -p'.escapeshellarg($password).' '.escapeshellarg($database);
            $cmd .= ' > ' . $destination;

            exec($cmd);

            $cmd = 'tar -rvf '.$filename.' -C '.$tmp.' ' . $database.'.sql';
            exec($cmd);

            unlink($destination);
        }

        rmdir($tmp);

        // Make sure to compress the resulting tarball
        $cmd = 'gzip -f ' . $filename;
        exec($cmd);

        return $filename;
    }

    /**
     * Creates a tarball compressed with gzip containing everything in source
     *
     * @return string file path of the backup
     */
    public function archiveFiles($source)
    {
        $filename = 'files'.DS.'platform.'.date('Ymd').'.tgz';
        $filename = $this->_getPath($filename);

        if(!file_exists($source)) {
            throw Exception('Cannot find ' . $source . ' for archiving');
        }

        $cmd = 'tar -cvzf '.$filename.' ' .$source;
        exec($cmd);
    }

    /**
     * Deletes all files older than $age (in days) in $directory
     * Instead of using the find command, we validate through PHP
     * which file needs to be kept. The reason for this is because of
     * CloudFuse's inability to display each files' modified time correctly!
     *
     * It's important to note that we rely on a timestamp, with format Ymd or YmdHis,
     * to determine the file's age. This timestamp must occur just before the file's extension,
     * for example: backup.weekly.20120801.tgz
     *
     * @param string	$directory
     * @param string	$age (in days)
     */
    public function cleanup($directory, $age)
    {
        $directory = $this->_getPath($directory);

        if($handle = opendir($directory))
        {
            while(($file = readdir($handle)) !== false)
            {
                if($file == '.' || $file == '..' || substr($file, 0, 8) != 'platform') {
                    continue;
                }

                $time = $this->_getTimestampFromFile($file);

                if($time !== false && $time < strtotime('-'.$age.' days')) {
                    unlink($directory.DS.$file);
                }
            }

            closedir($handle);

            return true;
        }

        return false;
    }

    /**
     * Adds base backup directory if given path is an absolute path
     *
     * @param string $filename
     */
    protected function _getPath($filename)
    {
        if(substr($filename, 0, 1) != '/') {
            $filename = $this->_backup_directory.DS.$filename;
        }

        $this->_createDirectories($filename);

        return $filename;
    }

    /**
     * Makes sure all parent paths exists
     *
     * @param string $filename
     */
    protected function _createDirectories($path)
    {
        $directory = dirname($path);
        $exists = file_exists($directory);

        if(!$exists)
        {
            $success = mkdir($directory, 0755, true);

            if(!$success) {
                throw new Exception('Could not create ' . $directory);
            }

            return $success;
        }

        return $exists;
    }

    /**
     * Extracts the timestamp from a given filename.
     *
     * @param string $filename
     */
    protected function _getTimestampFromFile($filename)
    {
        $parts = explode('.', $filename);
        $date = $parts[1];

        $stamp = strtotime($date);

        if(!$stamp) {
            return false;
        }

        return $stamp;
    }
}