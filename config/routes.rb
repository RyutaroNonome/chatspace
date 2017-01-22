Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  # resources :groups , except: [:index, :destroy]

  resources :groups do
    # resources :messages, only: [:create]
    resources :messages
  end

end