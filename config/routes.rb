Rails.application.routes.draw do
devise_for :admins, controllers: {
	registrations: 'admins/registrations',
	sessions: 'admins/sessions'
}
devise_for :users, controllers: {
	registrations: 'users/registrations',
	sessions: 'users/sessions'
}

get 'users/:id/cancel' => 'users#cancel'
get 'admins_users/:id/userorder' => 'admins_orders#userorder'


get 'users/:id/cancel' => 'users#cancel'
put 'users/:id/is_quit' => 'users#is_quit'

resources :admins_items do
	get :autocomplete_artist_name, :on => :collection
end

  resources :homes,:items, :admins_artists, :users, :orders, :carts, :addresses, :reviews, :admins, :admins_orders, :admins_stocks, :admins_genres, :admins_labels, :order_options, :admins_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
