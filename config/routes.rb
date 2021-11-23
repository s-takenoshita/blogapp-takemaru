Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  root to: 'articles#index'

  resources :articles do
    resource :comments, only: [:new, :create]
  end

  resource :profile, onry: [:show, :edit, :update]
end
