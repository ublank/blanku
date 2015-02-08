Rails.application.routes.draw do
  root 'welcome#index'

  # get 'users/new'
  # get 'users/show'
  # get 'users/create'

  resources :users, only: [:create]

  resources :sessions, only: [:create, :destroy]

  namespace :api do

    resources :question_cards do
      resources :answer_cards
    end

  end

  get 'cards/*other', to: 'welcome#index'
  get 'cards', to: 'welcome#index'

end
