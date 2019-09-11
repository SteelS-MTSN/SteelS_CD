Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :homes, :items, :users, :orders, :carts, :addresses, :reviews, :admins, :admins_orders, :admins_stocks, :admins_items, :admins_users, :admins_artists, :admins_genre, :admins_labels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
