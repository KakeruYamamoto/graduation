Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  get 'users/show'
  get 'search', to: 'events#search'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
        }
  resources :users, only: [:show] do
    collection do
      get :favorite
    end
  end
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
