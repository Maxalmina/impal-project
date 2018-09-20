Rails.application.routes.draw do
  get "/signin", to: "user_sessions#new", as: "signin"
  root "landing_pages#landing"
end
