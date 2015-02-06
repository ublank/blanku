var Cards = Cards || {
  Models: {},
  Collections: {},
  Views: {},
  Templates: {}
};

Cards.Models.QuestionCard = Backbone.Model.extend(
  {
    initialize: function() {

    },
    defaults:{

    }
  }

);

Cards.Models.AnswerCard = Backbone.Model.extend(
  {
    initialize: function() {

    },
    defaults:{
    }
  }
);

Cards.Collections.CommunityAnswers = Backbone.Collection.extend({
  model: Cards.Models.AnswerCard,
  url: "/api/answer_cards/" 

});

Cards.Collections.CommunityStack = Backbone.Collection.extend({
  model: Cards.Models.QuestionCard
});

Cards.Views.CommunityAnswers = Backbone.View.extend({
  initialize: function(){
    // this.collection.fetch();
    this.listenTo(this.collection, 'all', this.render);
  },
  render: function(){
    var self = this; //FIX THE SCOPE ISSUES
    this.$el.empty();

    _.each( this.collection.models,
      function(answerCard){
        var answerCardView = new Cards.Views.AnswerCard({ model: answerCard });
        self.$el.append( answerCardView.render().el );
      } //function
    ); //each
    return self;
  }
});

Cards.Views.CommunityStack = Backbone.View.extend({
  intialize: function(){
    this.listenTo(this.collection, 'all', this.render);
  },
  render: function(){
    var self =this;
    this.$el.empty();

    _.each( this.collection.models,
      function(questionCard){
        var questionCardView = new Cards.Views.QuestionCard({ model: questionCard });
        self.$el.append( questionCardView.render().el );
      }
    );//each
    return self;
  }
});

Cards.Templates.QuestionCardCompleted = [

  "<h3><%= Testing Questions %></h3>",
  "<button class='questions'>Answer</button>"

].join("");


Cards.Templates.AnswerCardNew = [

  //"<h3><%= answerTitle %></h3>",
  "<input id='answerText' type='text' value='<%= answerText %>' />",
  // Consider a class then an ID. 
  "<button class='answer'>Submit</button>"
].join("");

Cards.Templates.QuestionCardNew = [
  "<input id='questionText' type='text' value='<%= questionText %>' />",
  "<button class='question'>Submit</button>"
].join("");


Cards.Templates.AnswerCardCompleted = [
  "<p> <%= answerText %> </p>"
].join("");

Cards.Templates.QuestionCard = [
  "<p> <%= questionText %> </p>"
].join("");



Cards.Views.AnswerCard = Backbone.View.extend({
  initialize: function(){

    this.listenTo(this.model, 'change', this.render);
  
  },
  tagName: 'div',
  events: {
    "click button[class='answer']": 'submit'
  },

  render: function() {
    var templateDone = _.template( Cards.Templates.AnswerCardCompleted );
    var self = this;
    this.$el.empty();
    this.$el.html( templateDone(this.model.attributes) );
    return self;
  },

  renderNew: function() {
    var templateNew = _.template( Cards.Templates.AnswerCardNew );
    var self = this;
    this.$el.empty();
    this.$el.html( templateNew(this.model.attributes) );
    return self;
  },

  submit: function() {
    this.model.attributes.answerText = $(this.el.querySelector('input#answerText')).val();
    this.render();
    // $.post('/api/answers',answerText);
  },

});

Cards.Views.QuestionCard = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, 'all', this.render);
    //change 'all' to sync later
  },
  tagName: 'div',
  events: {
    "click button[class='question']": 'submit'
  },

  render: function(){
    var self = this;
    var template = _.template( Cards.Templates.QuestionCard );
    this.$el.empty();
    this.$el.html( template(this.model.attributes) );
    return self;
  },

  renderNew: function(){
    var templateNew = _.template( Cards.Templates.QuestionCardNew );
    var self = this;
    this.$el.empty();
    this.$el.html( templateNew(this.model.attributes) );
    return self;
  },

  submit: function() {
    this.model.attributes.questionText = $(this.el.querySelector('input#questionText')).val();
    this.render();
  }
});






