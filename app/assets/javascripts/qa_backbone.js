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
    // console.log(this);
    return this;
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
                    $(questionCardView.render().el).click(
                      function(){
                        console.log('I clicked a link and I liked it.')
                        window.router.navigate('cards/'+questionCard.attributes.id+'/share',true);
                      }
                    );
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

Cards.Templates.LoginForm = [
        "<label>Email <input type='text' name='email' id='email'/> </label> <br>",
        "<label>Password <input type='password' name='password' id='password'/> </label> <br>",
        "<button id='loginButton'>Submit</button>",
        "<button id='userSignupButton'>New User?</button>"
].join("");

Cards.Templates.SignUpForm = [
    "<p><label>Email <input type='text' name='email' id='email'/> </label> </p>",
    "<p><label>First Name <input type='text' name='fname' id='fname'/> </label> </p>",
    "<p><label>Last Name <input type='text' name='lname' id='lname'/> </label> </p>",
    "<p><label>Password <input type='password' name='password' id='password'/> </label> </p>",
    "<p><button id='loginButton'>Submit</button></p>"
].join("");

//MODEL-VIEWS
Cards.Views.AnswerCard = Backbone.View.extend({

  initialize: function(){
    this.listenTo(this.model, 'all', this.render);
  },

  render: function() {
    var templateDone = _.template( Cards.Templates.AnswerCardCompleted );
    this.$el.empty();
    this.$el.html( templateDone(this.model.attributes) );
    this.$el.css({border: "1px solid black"});
    return this;
  }


});


Cards.Views.QuestionCard = Backbone.View.extend({

  initialize: function(){
    this.listenTo(this.model, 'sync', this.render); //change 'all' to sync later
  },

  render: function(){

    this.$el.empty();
    var self = this;
    var template = _.template( Cards.Templates.QuestionCard );
    this.$el.html( template(this.model.attributes) );
    this.$el.css({border: "1px solid black"});
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
    this.$el.empty();
    var templateNew = _.template( Cards.Templates.QuestionCardNew );
    this.$el.html( templateNew(this.model.attributes) );
    this.$el.css({border: "1px solid black"});
    return this;
  },

  submit: function() {
    var that = this;
    var question_text = $(this.el.querySelector('textarea#questionText')).val();
    this.model.save('question_text', question_text, {
        success: function (){
            console.log('Success!');
            that.$el.empty();
            window.router.navigate('cards/'+that.model.attributes.id, true);
        },
        error: function (){
            console.log('failed yo');
            window.router.navigate('cards/login', true);
        }
    });
  }
});

Cards.Views.AnswerCardForm = Backbone.View.extend({

  events: { "click button[class='answer']": 'submit' },

  render: function() {
    this.$el.empty();
    var templateNew = _.template( Cards.Templates.AnswerCardNew );
    this.$el.html( templateNew(this.model.attributes) );
    this.$el.css({border: "1px solid black"});
    return this;
  },
  submit: function() {
    var that = this;
    var answer_text = $(this.el.querySelector('textarea#answerText')).val();
    console.log(answer_text);
    console.log('hoohaw');

    this.model.save('answer_text', answer_text, {
        success: function (){
            console.log('Success!');
            that.$el.empty();
            window.router.navigate('cards/'+that.model.attributes.question_card_id, true);
        },
        error: function (){
            console.log('failed yo');
            window.router.navigate('cards/login', true);
        }
    });
  }

  // submit: function() {
  //   this.model.attributes.answer_text = $(this.el.querySelector('textarea#answerText')).val();
  //   this.render();
  //   this.model.save();
  // },

});

//DOCUMENT RENDER FUNCTIONS


Cards.Routers.Main = Backbone.Router.extend({

  routes: {
    '': 'renderDailyDeck',
    'cards': 'renderDailyDeck',
    'cards/new': 'renderQuestionForm',
    'cards/login': 'renderLoginForm',
    'cards/signup': 'renderSignUpForm',
    'cards/:question_id': 'renderSingleQuestionView',
    'cards/:question_id/share': 'renderAnswerForm'

  },

   renderQuestionForm: function(){
      console.log("rendering question form");
      questionFormDiv = document.querySelector('div#flippable');
      questionFormView = new Cards.Views.QuestionCardForm({el: questionFormDiv, model: new Cards.Models.QuestionCard() });
      questionFormView.render();
  },

   renderDailyDeck: function(){
      console.log("rendering daily deck");
      divMain = document.querySelector('div#flippable');
      questionCards = new Cards.Collections.QuestionCards();
      questionsView = new Cards.Views.QuestionCards({el: divMain, collection:questionCards});
  },

   renderAnswerForm: function(questionID){
      console.log("rendering question answer");
      flippableDiv = document.querySelector('div#flippable');
      questionCard = new Cards.Models.QuestionCard({id:questionID});
      questionCard.fetch();
      questionView = new Cards.Views.QuestionCard({el:flippableDiv, model:questionCard});

      // answerFormDiv = document.querySelector('div#flippable');
      answerFormView = new Cards.Views.AnswerCardForm({el: flippableDiv, model: new Cards.Models.AnswerCard({question_card_id:questionID}) });
      // answerFormView.render();

      $test = $('div#flippable');
      var clicked = false;

      $test.click(function(){
        if(!clicked){
          clicked = true;
          console.log('clicked ' + clicked);
          $test.animate(
            { opacity: 0 },
            {
              step: function(now,fx){
              $test.css({ transform: "scaleY("+now+")" });
            },
              duration: 'slow'
            },
            'linear'
          ).promise().done(function (){
            $('div.questionCard').empty();
            // debugger;
            answerFormView.render();
            $test.animate(
              { opacity: 1 },
              {
                step: function(now,fx){
                $test.css({ transform: "scaleY("+now+")" });
              },
                duration: 'slow'
              },
              'linear'
            );//animate
          });//promise done
        }//if
      });
  }, //render answer form

   renderSingleQuestionView: function(questionID){
      console.log("rendering single question view");
      var $flippableDiv = $('div#flippable');

      var questionCard = new Cards.Models.QuestionCard({id:questionID});
      var answerCards = new Cards.Collections.AnswerCards(questionID);

      var $questionCardDiv = $('<div>');
      $questionCardDiv.addClass('questionCard');
      $questionCardDiv.appendTo($flippableDiv);
      var questionView = new Cards.Views.QuestionCard({el: $questionCardDiv, model:questionCard});

      var $answerCardsDiv = $('<div>');
      $answerCardsDiv.addClass('answerCards');
      $answerCardsDiv.appendTo($flippableDiv);
      // debugger;
      var answerCardsView = new Cards.Views.AnswerCards({collection: answerCards, el: $answerCardsDiv});

      answerCards.fetch();
      questionCard.fetch();

  },

    renderLoginForm: function(){
        var that = this;
        console.log("login form");
        $("div.auth").html(Cards.Templates.LoginForm);
        $('#loginButton').on('click', function(){
            data = JSON.stringify({email: $('#email').val(), password: $('#password').val()});
            $.ajax('/sessions', {
                type: "POST",
                data:data,
                contentType: "application/json"
            }).done(function (response){
                console.log(response);
                window.USERID = response.id;
                $("div.auth").empty();
            });
        });
    }, //render login form

    renderSignUpForm: function(){
      $auth = $("div.auth");
      $auth.html(Cards.Templates.SignUpForm);
      $('#loginButton').on('click', function(){
          data = JSON.stringify({
              email: $('#email').val(),
              fname: $('#fname').val(),
              lname: $('#lname').val(),
              password: $('#password').val()
            });
          // console.log(data);
          $.ajax('/users', {
              type: "POST",
              data:data,
              contentType: "application/json"
          }).done(function (response){
              console.log(response);
              $('.auth').empty();
          });
          // $(this).parent().empty();
          // that.navigate('cards/new', true);
      });
    }//render sign up form

});

function initializeNavBar(){

    $('#loginFormButton').on('click', function (){
        //$('div.main').children().each( function(){ $(this).empty(); } );
        window.router.navigate('cards/login', true);
    });

    $('#signUpFormButton').on('click', function (){
      //  $('div.main').children().each( function(){ $(this).empty(); } );
        window.router.navigate('cards/signup', true);
    });

    $('#newQuestionButton').on('click', function (){
      //  $('div.main').children().each( function(){ $(this).empty(); } );
        window.router.navigate('cards/new', true);
    });

    $('#viewDailyDeckButton').on('click', function (){
        //$('div.main').children().each( function(){ $(this).empty(); } );
        window.router.navigate('/', true);
    });

}

$(function() {
  window.router = new Cards.Routers.Main();
  Backbone.history.start({pushState: true});
  initializeNavBar();
});
