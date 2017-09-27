Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { registrations: "registrations" }
  root 'pages#home'

 	resources :tweets do
    	resources :replies, only: [:create, :edit, :update, :destroy]
  		resources :likes, only: [:create, :destroy]
	end
  
  resources :users, only: [:show, :edit, :update] do
  	resources :user_statuses, only: [:create, :destroy]

  end


end
