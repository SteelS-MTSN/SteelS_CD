class ReviewsController < ApplicationController
	def new
		@review = Review.new
	end

	def edit
		@review = Review.find(params[:id])
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.item_id = session[:item]
		@review.save!
		redirect_to item_path(@review.item_id)
	end

	def update
		@review = Review.find(params[:id])
		@review.update!(review_params)
		redirect_to item_path(@review.item_id)
	end
end
