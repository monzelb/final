Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests, except: [:update, :edit, :destroy]


    get '/search', to: 'requests#search'


  root 'requests#index'
end
