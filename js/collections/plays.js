App.Collections.Plays = Backbone.Collection.extend({
    model: App.Models.Play,
    url: '/json/plays.xqy',
    initialize: function(options) {
        "use strict";
        console.log('initializing Plays collection');
        _.bindAll(this, 'parse');
    },
    parse: function(response) {
        return response.plays.play;
    }
});