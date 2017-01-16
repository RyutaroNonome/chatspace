Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  # root 'top#view'
end