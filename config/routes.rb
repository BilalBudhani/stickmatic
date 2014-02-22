Stickmatic::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :packs
  resources :carts  do
    collection do
      delete :remove
    end
  end

  root 'home#index'
  get '/basket' , to: "carts#index", as: 'basket'
end
