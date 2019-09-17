class AdminsUsersController < ApplicationController
PER = 2
	def index
        @users = User.page(params[:page]).reverse_order.per(PER)

		
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

    redirect_to admins_user_path(@user.id)
 
      
    
  end
private 
def user_params
    params.require(:user).permit(:family_name, :first_name, :family_kana, :first_kana, :post_code, :address, :phone, :email)
end
end
