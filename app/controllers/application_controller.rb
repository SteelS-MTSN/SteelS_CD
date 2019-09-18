class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

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
		new_admin_session_path
	end
	# case resource
	# when User
	# new_user_session_path
	# when Admin
	# 	new_admin_session_path
	# end

end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :post_code, :address, :phone, :is_quit])
  end
end