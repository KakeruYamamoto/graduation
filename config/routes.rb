# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'events#index'
  resources :users, only: %i[index show] do
    collection do
      get :following
    end
  end
  resources :contacts, only: %i[index new create show destroy]
  resources :favorites, only: %i[create destroy]
  resources :parthicipant_managements, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :events do
    collection do
      post :confirm
      post :new_guest, as: 'guest_sign_in'
      get :favorite
      get :parthicipante_events
      get :search
    end
  end
end
