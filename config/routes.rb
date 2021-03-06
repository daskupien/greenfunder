Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: [:index, :show, :new, :create, :destroy] do
    resources :investments, only: [:new, :create]
  end
  resources :users, only: [:show]
  resources :charges
end
