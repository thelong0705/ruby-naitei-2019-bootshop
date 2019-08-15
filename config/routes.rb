Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root to: "static_pages#index"
  resources :categories, only: :show
  resources :products, only: :show
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
end
