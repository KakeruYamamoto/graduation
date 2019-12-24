Rails.application.routes.draw do
  resources :events do
    collection do
      post :confirm
    end
  end
end
