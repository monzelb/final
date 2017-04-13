Rails.application.routes.draw do
  devise_for :views
    devise_for :users, controllers: { sessions: 'users/sessions'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests, except: [:update, :edit, :destroy]
  resources :comments, except: [:edit, :update, :destroy]

    root 'requests#index'

    get '/search', to: 'requests#search'

    get 'requests/:request_id/comments/new', to: 'comments#new', as: 'new_request_comment'
    delete 'requests/:id', to: 'requests#destroy', as: 'requests_destroy'

    post '/comments', to: 'comments#create'
    delete '/comments/:id', to: 'comments#destroy', as: 'comment_destroy'

      # User Routes
    post '/users/:id', to: 'users#email', as: 'user_email'
    get '/users/:id', to: 'users#show', as: 'user'
    as :user do
      get '/users', to: 'users#show', as: "user_root"
    end

    devise_scope :user do
    get 'settings', to: 'users/registrations#account', as: "user_account"
  end


  
end
