class ItemsController < ApplicationController
Per = 6
def index
	@items = Item.page(params[:page]).per(Per)
 	@search = Item.ransack(params[:q])
 	# 検索結果
    @items = @search.result
 	end
 end
def show
end