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

  # Rails routes has priority over the backbone router
  # welcome#index pretty much allows the backbone router to work, so
  # when you got to '/cards' first rails goes, is there a cards route? yes/no
  # oh you want it to go to welcome#index, ok ill go to welcome index
  # then backbone is chilling at welcome index, sees the browser goes, cool, now im gonna route you by backbone.
  get 'cards/*other', to: 'welcome#index'
  get 'cards', to: 'welcome#index'
  get '*other', to: 'welcome#index'

end
