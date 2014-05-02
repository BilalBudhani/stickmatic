Stickmatic::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :packs

  resources :charging do
    collection do
      post :charging_response
      get :charging_request
    end
  end

  resources :orders, only: [:update] do
    get :success
    resources :addresses, only: [:new, :create]
  end

  root 'home#index'
  get '/tos', to: 'home#tos'
  get '/privacy', to: 'home#privacy'
  get 'contact-us', to: 'home#contact'
  get '/basket' , to: "orders#index", as: 'basket'
end
