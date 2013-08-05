Landing::Application.routes.draw do
  root to: 'application#index'

  resources :orders, only: :create
end
