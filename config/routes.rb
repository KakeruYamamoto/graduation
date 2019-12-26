Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users, only: [:show]
  devise_for :users, controllers: {
        registrations: 'users/registrations'
        }
  root to: 'events#index'
  resources :events do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
