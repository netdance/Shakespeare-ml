
App.Routers.Main = Backbone.Router.extend({
    routes: {
        'plays': 'plays',
        'home': 'home',
        '': 'home'
    },
    plays: function() {
        console.log('in plays router');
        
        var collection = new App.Collections.Plays();
        var listView = new App.Views.Plays({
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
    },
    home: function() {
        console.log('in home router');
        App.mainAnchor.showLanding();
    }
});