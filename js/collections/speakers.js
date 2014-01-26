App.Collections.Speakers = Backbone.Collection.extend({
    model: App.Models.Speaker,
    url: '/json/speakers.xqy',
    initialize: function(options) {
        "use strict";
        console.log('initializing Speakers collection');
        _.bindAll(this, 'parse');
    },
    parse: function(response) {
        return response.speakers.speaker;
    }
});