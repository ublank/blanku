class Api::AnswerCardsController < ApplicationController

  def index 
    question_card = QuestionCard.find(params[:question_card_id])
    answer_cards = question_card.answer_cards
    puts answer_cards
    render json: answer_cards
  end

  def create 
    qcard = AnswerCard.create(answer_card_params)
    render json: qcard
  end
  # result = HTTParty.post('http://localhost:3000/api/answer_cards', {body:{question_card_id:7, text: "another from httparty-------"}.to_json,  headers: {'Content-Type' => 'application/json'}})
  
  def show
    render json: AnswerCard.find(params[:id])
  end

  def update
    card = AnswerCard.find(params[:id])
    card.update(answer_card_params)
    render json: card
  end
  # result = HTTParty.put('http://localhost:3000/api/answer_cards/1', {body:{question_card_id:7, text: "CHANGED!"}.to_json,  headers: {'Content-Type' => 'application/json'}})

  def destroy
    AnswerCard.find(params[:id]).destroy
    head :no_content
  end
  #HTTParty.delete('http://localhost:3000/api/answer_cards/4')

  def answer_card_params
    params.require(:answer_card).permit(:user_id, :answer_text, :question_card_id, :expiration_date)
  end

end

