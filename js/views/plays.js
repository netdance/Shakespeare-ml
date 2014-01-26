App.Views.Plays = Backbone.View.extend({
    collection: null,
    $container: null,
    attributes: {
        class: 'container'
    },
    template: _.template($('#template-plays').html()),
    subViews: [],
    initialize: function(options) {
        "use strict";
        _.bindAll(this, 'render', 'insert', 'refresh', 'close','destroySubviews');
        console.log('initializing plays view');
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
        console.log('rendering plays');
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
        var $container = this.$('#playsList').empty();
        console.log('emptying container ' + $container.attr('id'));
        
        var owningView = this;
        this.collection.each(function(play) {
            console.log('creating/rendering play ' + play.attributes.title);
            console.log('creating/rendering play with uri ' + play.attributes.uri);
            var newPlayRow = new App.Views.Play({
                model: play,
                $container: $container
            });
            newPlayRow.render();
            owningView.subViews.push(newPlayRow);
        });
        
        return this;
    },
    insert: function() {
        "use strict";
        console.log('inserting plays');
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
