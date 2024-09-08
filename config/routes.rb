Rails.application.routes.draw do
  post "/users" => "users#create"

  patch "/users/:id" => "users#update"

  post "/sessions" => "sessions#create"

  resources :events

  resources :volunteer_hours
end
