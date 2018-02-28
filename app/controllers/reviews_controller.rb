class ReviewsController < ApplicationController
    before_filter :authorize

    def create
       @review = Review.new(review_params)
       @review.user_id = current_user.id 
       @review.product_id = params[:product_id] #Not sure why product_id isnt passed with review_params
       puts @review.to_json
       if @review.save
        redirect_to :back #not sure where to redirect to here
      else
        redirect_to :back
      end
    end
    def destroy 
        @review = Review.find params[:id]
        @review.destroy
        redirect_to :back, notice: 'Review deleted!'
    end
    def review_params
        params.require(:review).permit(
          :product_id,
          :description,
          :rating
        )
      end
end
