App.Collections.Speakers = Backbone.Collection.extend({
    model: App.Models.Speaker,
    baseurl: '/json/speakers.xqy?',
    url: function() {
        return this.baseurl + $.param({
            'uri': this.play
        });
    },
    initialize: function(options) {
        "use strict";
        console.log('initializing Speakers collection');
        _.bindAll(this, 'parse', 'url');
        if (options) {
            if (options.play) {
                this.play = options.play;
            }
        }
    },
    parse: function(response) {
        return response.speakers.speaker;
    }
});