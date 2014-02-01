App.Collections.Speeches = Backbone.Collection.extend({
    model: App.Models.Speeches,
    play: null,
    speaker: null,
    baseurl: '/json/speakerspeeches.xqy?',
    url: function() {
        return this.baseurl + $.param({
            'speaker': this.speaker,
            'uri': this.play
        });
    },
    initialize: function(options) {
        "use strict";
        console.log('initializing Speeches collection');
        _.bindAll(this, 'parse', 'url');
        if (options) {
            if (options.play) {
                this.play = options.play;
            }
            if (options.speaker) {
                this.speaker = options.speaker;
            } else {
                throw Error("Need to have a speaker set")
            }
        }
    },
    parse: function(response) {
        return response.result.play;
    }
});