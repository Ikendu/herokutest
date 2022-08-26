Rails.application.routes.draw do
  get 'deco/page'
  get "home/index"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "login" => "home#login"
  post "logout" => "home#logout"
  get "about" => "home#about"
  get "hair" => "home#hair"
  get "admin" => "home#admin"
  get "ikendu" => "home#ikendu"
  post "create_admin" => "home#create_admin"

  post "home/add" => "home#add"  
  get "home/:id/edit" => "home#edit"
  post "home/:id/update" => "home#update"
  get "new" => "home#new" 
  post "home/new" => "home#new"
  get "home/:id" => "home#show"
  post "home/:id/destroy" => "home#destroy"



  get "deco/new" => "deco#new"
  post "deco/create" => "deco#create"
  post "deco/new" => "deco#new"
  get "deco/:id/edit" => "deco#edit"
  post "deco/:id/update" => "deco#update"
  post "deco/:id/destroy" => "deco#destroy"
  get "deco/:id" => "deco#show"

  get "application/hello"

 

end
