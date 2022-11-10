Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  # root to: "users#index"
  post 'authenticate', to: 'authentication#authenticate'

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes
  end

end
