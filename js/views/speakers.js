App.Views.Speakers = Backbone.View.extend({
    collection: null,
    $container: null,
    attributes: {
        class: 'container'
    },
    template: _.template($('#template-speakers').html()),
    //headerTemplate: _.template($('#template-speakers-header').html()),
    subViews: [],
    initialize: function(options) {
        "use strict";
        _.bindAll(this, 'render', 'insert', 'refresh', 'close','destroySubviews');
        console.log('initializing speakers view');
        this.collection = options.collection;
        this.$container = options.$container;
        this.listenTo(this.collection, 'reset', this.render);
    },
    refresh: function() {
        "use strict";
        this.collection.fetch({reset: true});
    },
    render: function() {
        "use strict";
        console.log('rendering speakers');
        this.destroySubviews();

        this.$el.html(this.template());
        /*
         var pagerView = new App.Views.Pager({
            collection: this.collection,
            $container: this.$el
        });
        pagerView.render();
        this.subViews.push(pagerView);
        */
        var $container = this.$('#speakersList').empty();
        console.log('emptying container ' + $container.attr('id'));
        //$container.append(this.headerTemplate());
        
        var owningView = this;
        this.collection.each(function(speaker) {
            console.log('creating/rendering speaker ' + speaker.attributes.name);
            var newSpeakerRow = new App.Views.Speaker({
                model: speaker,
                $container: $container
            });
            newSpeakerRow.render();
            owningView.subViews.push(newSpeakerRow);
        });
        
        return this;
    },
    insert: function() {
        "use strict";
        console.log('inserting speakers');
        this.$container.append(this.$el);
        return this;
    },
    destroySubviews: function() {
        _.each(this.subViews, function(view) {
            console.log('removing view '+view.cid);
            view.remove();
        });
        this.subViews = [];
    },
    close: function() {
        this.destroySubviews();
        this.remove();
    }

});
