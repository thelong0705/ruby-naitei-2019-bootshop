Rails.application.routes.draw do
  root to: "static_pages#index"

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  
  resources :categories, only: :show
  resources :products, only: :show
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  
  resources :carts, only: %i(index)
  post "carts", to: "carts#update"

  resources :charges, only: %i(create)
end
