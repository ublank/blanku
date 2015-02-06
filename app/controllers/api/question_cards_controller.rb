class Api::QuestionCardsController < ApplicationController

  #GET /api/question_cards
  def index 
    render json: QuestionCard.all
  end

  # POST /api/question_cards 
  def create 
    qcard = QuestionCard.create(question_card_params)
    render json: qcard
  end
  #result = HTTParty.post('http://localhost:3000/api/question_cards', {body:{user_id:1, text: "another from httparty-------", url: "WOOP WOOP WOOP"}.to_json,  headers: {'Content-Type' => 'application/json'}})
  
  #GET /api/question_cards/:id
  def show
    render json: QuestionCard.find(params[:id])
  end

  #PUT /api/question_cards/:id
  def update
    card = QuestionCard.find(params[:id])
    card.update(question_card_params)
    render json: card
  end
  #result = HTTParty.put('http://localhost:3000/api/question_cards/', {body:{user_id:1, text: "another from httparty-------", url: "WOOP WOOP WOOP"}.to_json,  headers: {'Content-Type' => 'application/json'}})

  #DELETE /api/question_cards/:id
  def destroy
    QuestionCard.find(params[:id]).destroy
    head :no_content
  end
  #HTTParty.delete('http://localhost:3000/api/question_cards/4')

  def question_card_params
    params.require(:question_card).permit(:user_id, :question_text, :url, :expiration_date)
  end

end

