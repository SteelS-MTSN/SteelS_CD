class AdminsUsersController < ApplicationController

	def index
        @users = User.all

		
	end

	def show

		@user = User.find(params[:id])
		
	end

	def edit
		@user = User.find(params[:id])
		
	end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
 
      
    
  end
end
