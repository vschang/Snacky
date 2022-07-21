Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do [:show, :edit, :update]
  end

  resources :posts do
  # only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :post_likes, only: [:create]
  end
  resources :post_likes, only: [:destory]

  get 'profile', to: 'pages#profile'
  get 'log_out', to: 'pages#destroy_sesh'
  get 'search', to: 'pages#search'
end
