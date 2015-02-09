class Api::QuestionCardsController < ApplicationController

  #GET /api/question_cards
  def index
    render json: QuestionCard.all
  end

  # POST /api/question_cards
  def create
    if session[:user_id]
      qcard = QuestionCard.create(question_card_params)
      render json: qcard
    else
      error = ({Status: 'Error', Message: 'You are not logged in'})
      render json: error, :status => 403
    end
  end

  #GET /api/question_cards/:id
  def show
    render json: QuestionCard.find(params[:id])
  end

  #PUT /api/question_cards/:id
  # def update
  #   card = QuestionCard.find(params[:id])
  #   card.update(question_card_params)
  #   render json: card
  # end

  #DELETE /api/question_cards/:id
  # def destroy
  #   QuestionCard.find(params[:id]).destroy
  #   head :no_content
  # end

  def question_card_params
    params.require(:question_card).permit(:user_id, :question_text, :url, :expiration_date)
  end

end
