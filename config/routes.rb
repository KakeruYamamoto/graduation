Rails.application.routes.draw do
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
