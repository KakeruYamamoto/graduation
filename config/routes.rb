Rails.application.routes.draw do
  resources :contacts, only: [:new, :create, :show, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:create, :destroy]
  resources :parthicipant_managements, only: [:create, :destroy]
  get 'users/show'
  get 'search', to: 'events#search'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
        }
  resources :users, only: [:show]
  root to: 'events#index'
  resources :events do
    collection do
      post :confirm
    end
    collection do
      get :favorite
    end
    collection do
      get :parthicipante_events
    end
  end

end
