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

#<<<<<<< HEAD
  get "/" => "homes#top"
  get "/carts/chose" => "carts#buy_chose"
  post "/carts/confirm" => "carts#buy_confirm"

  resources :carts, only: [:create, :index, :update]

  resources :items, :users, :orders, :addresses, :reviews, :admins, :admins_orders, :admins_stocks, :admins_items, :admins_users, :admins_artists, :admins_genre, :admins_labels
#=======


#>>>>>>> master
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
