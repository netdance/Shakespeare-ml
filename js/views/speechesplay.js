App.Views.SpeechesPlay = Backbone.View.extend({
    template: _.template($('#template-playspeech').html()),
    linetemplate: _.template($('#template-speechline').html()),
    $container: null,
    events: {
        'click .speech-expander': 'expander'
    },
    initialize: function(options) {
        _.bindAll(this, 'render', 'insert', 'expander');

        this.$container = options.$container;
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);
        this.insert();
    },
    render: function() {
        if (!this.model.attributes) return this;
        var title = this.model.attributes.title || 'not set';
        console.log('rendering play speeches' + title);
        this.$el.html(this.template(this.model.attributes));
        console.log('$el html: '+ this.$el.html());
        var $list = this.$el.find('ul');
        console.log('list html: '+$list.html());
        var linetemplate = this.linetemplate;
        this.model.attributes.line.forEach(function(line) {
            console.log("appending line "+line);
            $list.append(linetemplate({line: line}));
            console.log('list html: '+$list.html());
        });

        return this;
    },
    insert: function() {
        this.$container.append(this.$el);
    },
    expander: function(event) {
        if (!event || ! event.currentTarget) {
            throw Error("No target defined");
        }
        var $target = $(event.currentTarget);
        if ($target.hasClass('glyphicon-minus')) {
            $target.removeClass('glyphicon-minus');
            $target.addClass('glyphicon-plus');
        } else {
            $target.removeClass('glyphicon-plus');            
            $target.addClass('glyphicon-minus');
        }
        var $list = this.$el.find('ul');
        $list.slideToggle();
    }
});

