App.Views.Play = Backbone.View.extend({
    template: _.template($('#template-play').html()),
    $container: null,
    idAttribute: "uri",
    initialize: function(options) {
        _.bindAll(this, 'render', 'insert');

        this.$container = options.$container;
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);
        this.insert();
    },
    render: function() {
        var attr = this.model.attributes || 'not set';
        console.log('rendering play ' + attr);
        this.$el.html(this.template(this.model.attributes));
        return this;
    },
    insert: function() {
        this.$container.append(this.$el);
    }
});

