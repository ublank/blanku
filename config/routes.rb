Rails.application.routes.draw do
  root 'welcome#index'

  get 'users/new'
  get 'users/show'
  get 'users/create'

  resources :users

  namespace :api do
    resources :question_cards
  end

end
