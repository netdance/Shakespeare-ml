App.Views.NavigationBar = Backbone.View.extend({
    events: {
        'click .navbar-brand': 'onBrandClick',
        'click #playNavLink': 'onPlayClick',
        'click #speakerNavLink': 'onSpeakerClick'
    },
    el: '#topnav',
    onBrandClick: function () {
        App.browser.navigate('/home', {
            trigger: true
        });
    },
    onPlayClick: function () {
        App.browser.navigate('/play', {
            trigger: true
        });
    },
    onSpeakerClick: function () {
        App.browser.navigate('/speaker', {
            trigger: true
        });
    }
});