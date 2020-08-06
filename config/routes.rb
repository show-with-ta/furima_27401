Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :users
  resources :items do
    resources :purchases
  end
  resources :orders, only:[:create]
end
