App.Views.Speaker = Backbone.View.extend({
    template: _.template($('#template-speaker').html()),
    $container: null,
    initialize: function(options) {
        _.bindAll(this, 'render', 'insert');

        this.$container = options.$container;
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);
        this.insert();
    },
    render: function() {
        var attr = this.model.attributes || 'not set';
        console.log('rendering speaker ' + attr);
        this.$el.html(this.template(this.model.attributes));
        return this;
    },
    insert: function() {
        this.$container.append(this.$el);
    }
});

