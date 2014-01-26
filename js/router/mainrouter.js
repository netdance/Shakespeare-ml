
App.Routers.Main = Backbone.Router.extend({
    routes: {
        'plays': 'plays',
        'home': 'home',
        '': 'home'
    },
    plays: function(cat,search,page) {
        console.log('in plays router');
        /*
        var collection = new App.Collections.Products({
            page: page,
            cat: cat,
            search: search
        });
        var listView = new App.Views.Products({
            collection: collection,
            $container: App.mainAnchor.$el
        });
        App.mainAnchor.render({
            $child: listView
        });
        // emit a reset to signal our view to render
        collection.fetch({
            reset: true
        });
        */
    },
    home: function() {
        console.log('in home router');
        App.mainAnchor.showLanding();
    }
});