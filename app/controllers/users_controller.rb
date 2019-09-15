class UsersController < ApplicationController

	def show
        @user = current_user
		
	end

	def edit
	  	@user = User.find(params[:id])
	  if @user.id != current_user.id
	     redirect_to user_path(current_user)
	end

  def update
    if params[:user][:is_quit].present? #値があるかどうか
	@user= User.find(params[:id])
	@user.update(is_quit: true)
    else
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
    end
   end



    def cancel
    	
    end
  
end

private 
def user_params
    params.require(:user).permit(:family_name, :first_name, :family_kana, :first_kana, :post_code, :address, :phone, :email)
end

end
