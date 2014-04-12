Stickmatic::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :packs
  resources :order, only: [:update] do
    resources :addresses
  end

  root 'home#index'
  get '/tos', to: 'home#tos'
  get '/privacy', to: 'home#privacy'
  get 'contact-us', to: 'home#contact'
  get '/basket' , to: "orders#index", as: 'basket'
end
