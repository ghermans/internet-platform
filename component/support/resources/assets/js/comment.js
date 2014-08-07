if(!Comment) var Comment = {};

Comment = new Class({
    element : null,

    initialize: function(options) {
        this.element = document.id(options.container);
        this.token = options.token;

        if(!this.element) {
            return;
        }

        var that = this;
        this.element.getElements('a[data-action]').each(function(a) {
            if(a.get('data-action'))
            {
                a.addEvent('click', function(e) {
                    e.stop();
                    that.execute(this.get('data-action'), this.get('data-status'));
                });
            }
        });
    },

    execute: function(action, status)
    {
        var method = '_action' + action.capitalize();

        if($type(this[method]) == 'function')
        {
            this.action = action;

            // Abort the action when the editor is empty
            if(CKEDITOR.instances.text.getData()) {
                this[method].call(this, status);
            }
        }
    },

    _actionSubmit: function(status)
    {
        document.getElementById("comment").status.value = status;
        document.getElementById("comment").submit();
    }
});