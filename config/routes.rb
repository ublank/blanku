Rails.application.routes.draw do
  root 'welcome#index'

  get 'users/new'
  get 'users/show'
  get 'users/create'

  resources :users

  resources :sessions, only: [:create, :destroy]

  namespace :api do
    resources :question_cards
    resources :answer_cards
  end

end
