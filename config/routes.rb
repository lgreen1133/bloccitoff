Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:show]
  devise_scope :user do
    authenticated :user do 
      root to: 'devise/registrations#edit', as: :authenticated
    end

    unauthenticated do 
    root to: 'devise/sessions#new', as: :unauthenticated
    end
  end
end