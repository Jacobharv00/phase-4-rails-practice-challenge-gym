Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms, only: [:index, :show, :update, :destroy]
  resources :clients, only: [:index, :show, :update]

end
