
App.Routers.Main = Backbone.Router.extend({
    routes: {
        'plays': 'plays',
        'speakers': 'speakers',
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
    speakers: function() {
        console.log('in speakers router');
        
        var collection = new App.Collections.Speakers();
        var listView = new App.Views.Speakers({
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