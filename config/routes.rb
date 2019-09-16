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


  resources :homes, :items, :users, :orders, :carts, :addresses, :reviews, :admins, :admins_orders, :admins_stocks, :admins_items, :admins_users, :admins_artists, :admins_genre, :admins_labels, :order_options
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
