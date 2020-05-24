Rails.application.routes.draw do
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "posts#home"
  get "/about" => "posts#about"
  get "/posts" => "posts#index"
  get "/posts/new" => "posts#new"
  post "/posts/create" => "posts#create"
  get "/posts/:id" => "posts#show"
  get "/posts/:id/edit" => "posts#edit"
  post "/posts/:id/update" => "posts#update"
  post "/posts/:id/destroy" => "posts#destroy"

  get "/controldashboard" => "posts#controldashboard"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "/users/index" => "users#index"
  get "/users/new" => "users#new"
  post "/users/create" => "users#create"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  post "/users/:id/update" => "users#update"
  post "/users/:id/destroy" => "users#destroy"

end
