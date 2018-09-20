Rails.application.routes.draw do
  get "/signin", to: "user_sessions#new", as: "signin"
  get "/index", to: "landing_pages#index", as: "index"
  root "landing_pages#landing"
end
