Rails.application.routes.draw do
  get "/" => "contacts#index"
  get "/contacts" => "contacts#index"
  get "/contacts" => "contacts#new"
  post "/contact" => "contacts#create"
  get "/contacts/:id" => "contacts#show"
  get "/contacts/:id/edit" => "contactss#edit"
  patch "/contacts/:id" => "contacts#update"
  delete "/contacts/:id" => "contacts#destroy"
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"
end
