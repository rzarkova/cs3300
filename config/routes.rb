Rails.application.routes.draw do
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations"}
  resources :projects
  root to: 'projects#index'
end