Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/welcome", to: "home#index"

  get '/users/my_topics', to: 'users#my_topics', as: "my_topics"
  get '/users/my_categories', to: 'users#my_categories', as: "my_categories"
  get '/users/my_schedules', to: 'users#my_schedules', as: "my_schedules"
  
  resources :categories

  resources :topics

  resources :schedules
end
