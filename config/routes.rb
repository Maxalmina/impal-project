Rails.application.routes.draw do

  get "/description", to: "product#description"

  get "/register/:role", to: "users#new", as: "register"
  post "/register/:role", to: "users#create", as: "register_post"

  get "/signin", to: "user_sessions#new", as: "signin"
  post "/signin", to: "user_sessions#create", as: "signin_post"
  delete "/signout", to: "user_sessions#destroy", as: "signout"

  get "/static", to: "landing_pages#landing",as: "/static"

  root "landing_pages#index"
end
