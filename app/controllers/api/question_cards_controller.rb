class Api::QuestionCardsController < ApplicationController

  def index 
    render json: QuestionCard.all
  end

  def create 
  end

  def new
  end

  def edit
  end

  def show
    render json: QuestionCard.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
