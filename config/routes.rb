Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests, except: [:update, :edit, :destroy]

    root 'requests#index'

    get '/search', to: 'requests#search'

      # User Routes
    get '/users/:id', to: 'users#show', as: 'user'
    as :user do
      get '/users', to: 'users#show', as: "user_root"
    end


  
end
