Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :stories
  root 'stories#index'

  get 'admin/index'
  get 'my_stories', to: 'stories#my_stories'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
