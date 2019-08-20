Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root to: "static_pages#index"
  resources :categories, only: :show
  resources :products, only: :show
  root to: "static_pages#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :carts, only: %i(index)
  post "carts", to: "carts#update"
  delete "carts", to: "carts#destroy"

  resources :charges, only: %i(create)
end
