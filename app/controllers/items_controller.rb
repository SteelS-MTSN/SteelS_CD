class ItemsController < ApplicationController
Per = 6
def index
	@items = Item.page(params[:page]).per(Per)
end

end