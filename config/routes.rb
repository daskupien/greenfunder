Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: [:index, :show] do
    resources :investments, only: [:new, :create]
  end
  resources :users, only: [:show]
end
