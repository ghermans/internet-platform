module.exports = function(grunt) {

    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json'),

        sass: {
            mobile: {
                options: {
                    require: ['susy', 'illusion']
                },
                files: {
                    'application/site/public/theme/mobile/css/default.css': 'application/site/public/theme/mobile/css/default.scss',
                    'application/site/public/theme/mobile/css/ie.css': 'application/site/public/theme/mobile/css/ie.scss',
                    'application/site/public/theme/mobile/css/ie7.css': 'application/site/public/theme/mobile/css/ie7.scss'
                }
            },

            muhimu: {
                options: {
                    require: ['susy', 'illusion']
                },
                files: {
                    'application/site/public/theme/muhimu/css/default.css': 'application/site/public/theme/muhimu/css/default.scss',
                    'application/site/public/theme/muhimu/css/ie.css': 'application/site/public/theme/muhimu/css/ie.scss',
                    'application/site/public/theme/muhimu/css/ie7.css': 'application/site/public/theme/muhimu/css/ie7.scss'
                }
            }
        },

        watch: {
            cssmobile: {
                files: '**/*.scss',
                tasks: ['sass:mobile'],
                options: {
                    atBegin: true
                }
            },

            cssmuhimu: {
                files: '**/*.scss',
                tasks: ['sass:muhimu'],
                options: {
                    atBegin: true
                }
            },

            livereload: {
                // Here we watch the files the sass task will compile to
                // These files are sent to the live reload server after sass compiles to them
                files: [
                    'application/site/public/theme/mobile/css/default.css',
                    'application/site/public/theme/muhimu/css/default.css'
                ],
                options: {
                    livereload: true
                }
            }
        },

        // Concurrently tasking
        concurrent: {
            options: {
                logConcurrentOutput: true
            },
            mobile: {
                tasks: ["watch:cssmobile", "watch:livereload"]
            },
            muhimu: {
                tasks: ["watch:cssmuhimu", "watch:livereload"]
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-concurrent');

    // The default task will show the usage
    grunt.registerTask('default', 'Prints usage', function () {
        grunt.log.writeln('');
        grunt.log.writeln('Product site development');
        grunt.log.writeln('------------------------');
        grunt.log.writeln('');
        grunt.log.writeln('* run "grunt --help" to get an overview of all commands.');
        grunt.log.writeln('* run "grunt mobile" for platform v2.');
        grunt.log.writeln('* run "grunt muhimu" for platform v3.');
    });

    grunt.registerTask('mobile', ['concurrent:mobile']);
    grunt.registerTask('muhimu', ['concurrent:muhimu']);
};