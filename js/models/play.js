App.Models.Play = Backbone.Model.extend({
    defaults: {
        name: '',
        uri: ''
    },
    validate: function(attrs) {
        if (!attrs) {
            return 'no attributes set';
        }
        if (!attrs.title) {
            return 'need a title';
        }
        if (!attrs.uri) {
            return 'need a uri';
        }
        return false;
    },
    initialize: function(attributes) {
        var title = attributes.title || '<NOT SET>';
        console.log('Initializing a new Play model for ' + title);
        //_.bindAll(this,'sync');
    }
});