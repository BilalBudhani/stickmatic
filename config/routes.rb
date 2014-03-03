Stickmatic::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :packs

  root 'home#index'
  get '/basket' , to: "orders#index", as: 'basket'
end
