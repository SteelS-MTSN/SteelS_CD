class UsersController < ApplicationController

	def show
        @user = current_user
  end


	def edit
	  	@user = User.find(params[:id])
	  if @user.id != current_user.id
	     redirect_to user_path(current_user)

  	end
  end
  def update

    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
   end


  def is_quit
    @user = User.find(params[:id])
    @user.update!(is_quit: true)
    redirect_to new_user_registration_path
  end


  def cancel
  	@user = current_user
  end


  private 
  def user_params
      params.require(:user).permit(:family_name, :first_name, :family_kana, :first_kana, :post_code, :address, :phone, :email ,:is_quit)
  end

end
