Rails.application.routes.draw do
  resources :contacts, only: [:new, :create, :show, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:create, :destroy]
  resources :parthicipant_managements, only: [:create, :destroy]
  get 'users/show'
  # get 'search', to: 'events#search'
  # post '/events/guest_sign_in', to: 'events#new_guest'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
        }
  resources :users, only: [:show]
  root to: 'events#index'
  resources :events do
    collection do
      post :confirm
      # post :guest_sign_in, as: 'events#new_guest'
      post :new_guest,as:'guest_sign_in'
      get :favorite
      get :parthicipante_events
      get :search
    end
    # collection do
    #   get :favorite
    # end
    # collection do
    #   get :parthicipante_events
    # end
    # collection do
    #   post :new_guest
    # end
  end

end
