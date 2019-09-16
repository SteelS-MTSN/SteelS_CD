class AdminsUsersController < ApplicationController

	def index
        @users = User.all
		
	end
end
