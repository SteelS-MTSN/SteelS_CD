class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_deluser
  before_action :authenticate_deluser!

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(current_user)
    when Admin
      admins_path
    end
  end
  def after_sign_out_path_for(resource)
  	if resource.is_a?(User)
  		new_user_session_path
  	else
  		items_path
  	end
	# case resource
	# when User
	# new_user_session_path
	# when Admin
	# 	new_admin_session_path
	# end

  end



  private
  def current_deluser
    @current_user ||= current_user.try(:user)
  end

  def authenticate_deluser!
    return unless user_signed_in? && @current_user.is_quit?
    sign_out
    flash[:alert] = "Your team account has already been deleted."
    redirect_to new_user_session_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :post_code, :address, :phone, :is_quit])
  end
end