class Api::AnswerCardsController < ApplicationController

  #GET /api/answer_cards
  def index 
    render json: AnswerCard.all
  end

  # POST /api/answer_cards 
  def create 
    qcard = AnswerCard.create(answer_card_params)
    render json: qcard
  end
  # result = HTTParty.post('http://localhost:3000/api/answer_cards', {body:{question_card_id:7, text: "another from httparty-------"}.to_json,  headers: {'Content-Type' => 'application/json'}})
  
  #GET /api/answer_cards/:id
  def show
    render json: AnswerCard.find(params[:id])
  end

  #PUT /api/answer_cards/:id
  def update
    card = AnswerCard.find(params[:id])
    card.update(answer_card_params)
    render json: card
  end
  # result = HTTParty.put('http://localhost:3000/api/answer_cards/1', {body:{question_card_id:7, text: "CHANGED!"}.to_json,  headers: {'Content-Type' => 'application/json'}})

  #DELETE /api/answer_cards/:id
  def destroy
    AnswerCard.find(params[:id]).destroy
    head :no_content
  end
  #HTTParty.delete('http://localhost:3000/api/answer_cards/4')

  def answer_card_params
    params.require(:answer_card).permit(:user_id, :answer_text, :question_card_id, :expiration_date)
  end

end

