Rails.application.routes.draw do

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root to: "static_pages#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
end
