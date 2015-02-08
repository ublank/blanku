var Cards = Cards || {
  Models: {},
  Collections: {},
  Views: {},
  Templates: {},
  Routers: {}
};

//MODELS

Cards.Models.QuestionCard = Backbone.Model.extend(
  {
    url: function (){
        if(this.isNew()){
            return "/api/question_cards/";
        }else{
            return "/api/question_cards/"+this.id;
        }
    },
    initialize: function() {},
    defaults: {}
  }
);

Cards.Models.AnswerCard = Backbone.Model.extend(
  {
    url: "/api/question_cards/"+this.question_card_id+"/answer_cards",
    initialize: function() { },
  }
);

//COLLECTIONS

Cards.Collections.AnswerCards = Backbone.Collection.extend({

  initialize: function (question_card_id){
      this.question_card_id = question_card_id;
  },

  model: Cards.Models.AnswerCard,

  url: function(){
      return "/api/question_cards/"+this.question_card_id+"/answer_cards";
  }
});

Cards.Collections.QuestionCards = Backbone.Collection.extend({
  url: "/api/question_cards/",
  model: Cards.Models.QuestionCard
});


//COLLECTION-VIEWS

Cards.Views.AnswerCards = Backbone.View.extend({

  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function(){

    var self = this; //FIX THE SCOPE ISSUES
    this.$el.empty();
    _.each( this.collection.models,
      function(answerCard){
        var answerCardView = new Cards.Views.AnswerCard({ model: answerCard });
        self.$el.append( answerCardView.render().el );
      } //function
    ); //each return self;
  }

});

Cards.Views.QuestionCards = Backbone.View.extend({
    initialize: function(){
        this.collection.fetch();
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

//TEMPLATES
Cards.Templates.QuestionCardCompleted = [
  "<h3><%= Testing Questions %></h3>",
  "<button class='questions'>Answer</button>"
].join("");

Cards.Templates.AnswerCardNew = [
  "<h2>Answer the question</h2>",
  "<textarea id='answerText'></textarea>",
  '<br>',
  "<button class='answer'>Submit</button>"

].join("");

Cards.Templates.QuestionCardNew = [
  "<h2>Ask your question</h2>",
  "<textarea id='questionText'></textarea>",
  '<br>',
  "<button class='question'>Submit</button>"
].join("");

Cards.Templates.AnswerCardCompleted = [ "<p> <%= answer_text %> </p>" ].join("");

Cards.Templates.QuestionCard = [ "<p> <%= question_text %> </p>" ].join("");


//MODEL-VIEWS
Cards.Views.AnswerCard = Backbone.View.extend({

  initialize: function(){
    this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var templateDone = _.template( Cards.Templates.AnswerCardCompleted );
    this.$el.empty();
    this.$el.html( templateDone(this.model.attributes) );
    return this;
  },

  submit: function() {
    this.model.attributes.answer_text = $(this.el.querySelector('input#answerText')).val();
    this.render();
    this.model.save();
  }

});


Cards.Views.QuestionCard = Backbone.View.extend({

  initialize: function(){
    this.listenTo(this.model, 'all', this.render); //change 'all' to sync later
  },

  render: function(){
    var self = this;
    var template = _.template( Cards.Templates.QuestionCard );
    this.$el.empty();
    this.$el.html( template(this.model.attributes) );
    return self;
  },

  submit: function() {
    this.model.attributes.question_text = $(this.el.querySelector('input#questionText')).val();
    this.render();
    this.model.save();
  }

});

// FORM-VIEWS
Cards.Views.QuestionCardForm = Backbone.View.extend({

  events: { "click button[class='question']": 'submit' },

  render: function(){
    var templateNew = _.template( Cards.Templates.QuestionCardNew );
    this.$el.html( templateNew(this.model.attributes) );
    return this;
  },

  submit: function() {
    this.model.attributes.question_text = $(this.el.querySelector('textarea#questionText')).val();
    this.render();
    this.model.save();
  }
});

Cards.Views.AnswerCardForm = Backbone.View.extend({

  events: { "click button[class='answer']": 'submit' },

  render: function() {
    var templateNew = _.template( Cards.Templates.AnswerCardNew );
    this.$el.empty();
    this.$el.html( templateNew(this.model.attributes) );
    return this;
  },

  submit: function() {
    this.model.attributes.answer_text = $(this.el.querySelector('textarea#answerText')).val();
    this.render();
    this.model.save();
  },

});

//DOCUMENT ROUTER
Cards.Routers.Main = Backbone.Router.extend({
  routes: {
    '': 'renderDailyDeck',
    'cards/new': 'renderQuestionForm',
    'cards/:questionID': 'renderSingleQuestionView' 
  }, // routes

  renderQuestionForm: function(){
      questionFormDiv = document.querySelector('div.questionForm');
      questionFormView = new Cards.Views.QuestionCardForm({el: questionFormDiv, model: new Cards.Models.QuestionCard() });
      questionFormView.render();
  },

  renderDailyDeck: function(){
      divMain = document.querySelector('div.questionCard');
      questionCards = new Cards.Collections.QuestionCards();
      questionsView = new Cards.Views.QuestionCards({el: divMain, collection:questionCards});
  },

  renderAnswerForm: function(questionID){
      questionCardDiv = document.querySelector('div.questionCard');
      questionCard = new Cards.Models.QuestionCard({id:questionID});
      questionCard.fetch();
      questionView = new Cards.Views.QuestionCard({el:questionCardDiv, model:questionCard});
      answerFormDiv = document.querySelector('div.answerForm');
      answerFormView = new Cards.Views.AnswerCardForm({el: answerFormDiv, model: new Cards.Models.AnswerCard({question_card_id:questionID}) });
      answerFormView.render();
  },

  renderSingleQuestionView: function(questionID){
      questionCardDiv = document.querySelector('div.questionCard');
      questionCard = new Cards.Models.QuestionCard({id:questionID});
      questionCard.fetch();

      questionView = new Cards.Views.QuestionCard({el:questionCardDiv, model:questionCard});
      answerCards = new Cards.Collections.AnswerCards(questionID);
      answerCardsDiv = document.querySelector('div.answerCards');
      answerCardsView = new Cards.Views.AnswerCards({collection: answerCards, el:answerCardsDiv});
      answerCards.fetch();
      // answerCardView.render();
  }

});



$(document).ready(function() {
    // renderQuestionForm();
    // renderDailyDeck();
    // renderAnswerForm(5);
    renderSingleQuestionView(5);
});
