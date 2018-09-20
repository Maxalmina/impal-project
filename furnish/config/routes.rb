Rails.application.routes.draw do
  get "/signin", to: "user_sessions#new", as: "signin"
  root "landing_customer#landing"
end
