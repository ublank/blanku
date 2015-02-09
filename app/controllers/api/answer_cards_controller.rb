class Api::AnswerCardsController < ApplicationController

  def index
    question_card = QuestionCard.find(params[:question_card_id])
    answer_cards = question_card.answer_cards
    puts answer_cards
    render json: answer_cards
  end

  def create
    if session[:user_id]
      qcard = AnswerCard.create(answer_card_params)

      render json: qcard
    else
      error = ({Status: 'Error', Message: 'You are not logged in'})
      render json: error, :status => 403
    end
  end

  def show
    render json: AnswerCard.find(params[:id])
  end

  # def update
  #   card = AnswerCard.find(params[:id])
  #   card.update(answer_card_params)
  #   render json: card
  # end
  #
  # def destroy
  #   AnswerCard.find(params[:id]).destroy
  #   head :no_content
  # end

  def answer_card_params
    params.require(:answer_card).permit(:user_id, :answer_text, :question_card_id, :expiration_date)
  end

end
