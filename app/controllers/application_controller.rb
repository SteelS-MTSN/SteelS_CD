class ApplicationController < ActionController::Base

	def current_cart
		session[:cart_id]
		@cart = Cart.find(session[:cart_id])
	end

end
