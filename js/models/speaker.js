App.Models.Speaker = Backbone.Model.extend({
    defaults: {
        name: ''
    },
    validate: function(attrs) {
        if (!attrs) {
            return 'no attributes set';
        }
        if (!attrs.name) {
            return 'need a name';
        }
        return false;
    },
    initialize: function(attributes) {
        var name = attributes.name || '<NOT SET>';
        console.log('Initializing a new Speaker model for ' + name);
        //_.bindAll(this,'sync');
    }
});