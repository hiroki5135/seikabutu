Rails.application.routes.draw do
  get "user/index" => "user#index"
  get "user/new" => "user#new"
  post "user/create" => "user#create"
  post "user/:id/destroy" => "user#destroy"
  #get "user/:id/edit" => "user#edit"

  post "login" => "user#login"
  get "login" => "user#login_form"
  post "logout" => "user#logout"

  get "home/top" => "home#top"
  get "home/new" => "home#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "home/create" => "home#create"
  post "home/:id/destroy" => "home#destroy"
  get "home/:id/edit" => "home#edit"
  post "home/:id/update" => "home#update"
  post "home/:id/update" => "home#update"
end
