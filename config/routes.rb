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


  get "/" => "homes#top"
  get "/carts/chose" => "carts#buy_chose"
  post "/carts/confirm" => "carts#buy_confirm"

  resources :carts, only: [:create, :index, :update]
  resources :order_options, only: [:create, :show]


get 'users/:id/cancel' => 'users#cancel'
put 'users/:id/is_quit' => 'users#is_quit'


resources :admins_items do
	get :autocomplete_artist_name, :on => :collection
end

resources :items do
  resource :favorites
end

  resources :admins_artists, :users, :orders, :addresses, :reviews, :admins, :admins_orders, :admins_stocks, :admins_genres, :admins_labels, :admins_users, :admins_songs


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

