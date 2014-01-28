App.Views.Speaker = Backbone.View.extend({
    template: _.template($('#template-speaker').html()),
    $container: null,
    playURI: null,
    initialize: function(options) {
        _.bindAll(this, 'render', 'insert');
        if (options.playURI) {
            this.playURI = options.playURI;
        }
        this.$container = options.$container;
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);
        this.insert();
    },
    render: function() {
        var attr = this.model.attributes || 'not set';
        console.log('rendering speaker ' + attr);
        var params = _.clone(this.model.attributes);
        params.playURI = this.playURI;
        this.$el.html(this.template(params));
        return this;
    },
    insert: function() {
        this.$container.append(this.$el);
    }
});

