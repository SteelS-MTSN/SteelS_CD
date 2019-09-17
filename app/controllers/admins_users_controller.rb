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

    redirect_to admins_users_path
 
      
    
  end
private 
def user_params
    params.require(:user).permit(:family_name, :first_name, :family_kana, :first_kana, :post_code, :address, :phone, :email)
end
end
