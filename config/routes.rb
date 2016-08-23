Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"

  resources :users, except: [:edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :parks, only: [:index, :show, :create, :edit, :update] do
    resources :posts, only: [:create, :destroy]
  end

  resources :user_parks, only: [:create, :destroy]
  resources :park_features, only: [:create, :destroy]
  resources :features, only: [:create]
end
