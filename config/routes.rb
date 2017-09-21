Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "pages#home"
  resources :users, only: [:show, :edit, :update]
  resources :likes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
