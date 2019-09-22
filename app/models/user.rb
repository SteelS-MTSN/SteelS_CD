class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # def status_enable
  # 	user.where(is_quit: false)
  # end

  # def active_for_authentication?
  #   super && status_enable?
  # end
	# def self.find_first_by_auth_conditions(warden_conditions)
	# 	conditions = warden_conditions.dup
	# 	binding.pry
	# 	if login = conditions.delete(:login)
	# 	  where(conditions).where(["is_quit = value", { :value => login }]).first
	# 	else
	# 	  where(conditions).first
	# 	end
	# end


	# def find_for_authentication(warden_conditions)
	#   active.where(:is_quit => warden_conditions[:is_quit]).first
	# end

    has_many :order_option
    has_many :review

end
