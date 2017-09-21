Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations" }
  root 'tweets#index'
  resources :tweets do
    resources :replies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
