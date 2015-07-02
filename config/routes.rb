Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:show]
      resources :items, only: [:create, :destroy]
  devise_scope :user do
    authenticated :user do 
      root to: 'users#show', as: :authenticated
    end

    unauthenticated do 
    root to: 'devise/sessions#new', as: :unauthenticated
    end
  end
end