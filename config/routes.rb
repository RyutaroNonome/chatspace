Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"

  resources :groups, except: [:delete] do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create]
  end

end