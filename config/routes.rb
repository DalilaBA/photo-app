Rails.application.routes.draw do
  resources :images
  resources :plans
  post "checkout/create", to: "checkout#create"
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
