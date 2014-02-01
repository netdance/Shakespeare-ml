App.Models.Speeches = Backbone.Model.extend({
    defaults: {
        name: '',
        uri: ''
    },
    idAttribute: "uri",
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
        console.log('Initializing a new Speeches model for ' + title);
        //_.bindAll(this,'sync');
    }
});