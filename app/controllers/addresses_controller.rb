class AddressesController < ApplicationController
    PER = 5
	def new
		@user = current_user

		@address = Address.new
		
	end
	def index
		@user = current_user

		@address = Address.all
	end

	def create
		@user = current_user
		@address = Address.new(address_params)
		@address.user_id = @user.id
		@address.save

		redirect_to user_path(current_user)
	end

	def edit
		
		@address = Address.find(params[:id])



	end

	def update
		@address = Address.find(params[:id])
		@address.update(address_params)

		redirect_to addresses_path
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy

		redirect_to addresses_path
		
	end

	private
def address_params
    params.require(:address).permit(:sub_family_name, :sub_first_name, :sub_family_kana, :sub_first_kana, :sub_post_code, :sub_address)
end

end
