Rails.application.routes.draw do
  get 'users/new'

  get 'users/show'

  get 'users/create'

  root 'welcome#index'

  resources :users
end
