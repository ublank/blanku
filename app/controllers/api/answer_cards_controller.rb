class Api::AnswerCardsController < ApplicationController

  def index 
    if session[:user_id]
      question_card = QuestionCard.find(params[:question_card_id])
      answer_cards = question_card.answer_cards
      puts answer_cards
      render json: answer_cards
    else
      render json: {errors: "you're totally not logged in"}, :status => 403
    end
  end

  def create 
    if session[:user_id]
      qcard = AnswerCard.create(answer_card_params)
      render json: qcard
    else
      render json: {errors: "you're totally not logged in"}, :status => 403
    end
  end
  
  def show
    if session[:user_id]
      render json: AnswerCard.find(params[:id])
    else
      render json: {errors: "you're totally not logged in"}, :status => 403
    end
  end

  def update
    card = AnswerCard.find(params[:id])
    card.update(answer_card_params)
    render json: card
  end

  def destroy
    AnswerCard.find(params[:id]).destroy
    head :no_content
  end

  def answer_card_params
    params.require(:answer_card).permit(:user_id, :answer_text, :question_card_id, :expiration_date)
  end

end

