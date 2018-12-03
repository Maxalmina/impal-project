Rails.application.routes.draw do
  get "/register/", to: "users#new", as: "register"
  post "/register/", to: "users#create", as: "register_post"

  get "/signin", to: "user_sessions#new", as: "signin"
  post "/signin", to: "user_sessions#create", as: "signin_post"
  delete "/signout", to: "user_sessions#destroy", as: "signout"

  scope "/app" do
    resources :produsens do
      resources :furnitures, shallow: true
    end

    resources :transaksis, only: [:index, :show, :create, :update, :destroy]

    resources :users, only: [:index, :show, :edit, :update, :destroy]

    get "/profile", to: "pages#profile", as: "profile"
  end
  get "/app", to: "produsens#index", as: "dashboard"

  get "/sign", to: "pages#index", as: "sign"

  root "produsens#index"
end
