class ListingsController < ApplicationController
	before_action :find_list, only: [:show, :destroy, :update]
	def new	
		@list = Listing.new
	end

	def index
		@lists = Listing.paginate(:page => params[:page], :per_page => 2)
  end

	def show
		@listing = Listing.find(params[:id])
		@reservation = Reservation.new
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		flash.now[:msg] = "Success to Remove Property"
		respond_to do |format|
			format.html {redirect_to user_path(current_user.id)}
			format.js
		end
	end

	def edit
		@list = Listing.find(params[:id])
	end

	def create
		@list = current_user.listings.new(listing_params)
			if @list.save
				redirect_to user_path(current_user.id)
			else
				flash.now[:message] = 'Please try again!!'
				render :new
			end
	end

	def update
		if @list.update(listing_params)
			redirect_to user_path(current_user.id)
		else
			flash.now[:message] = 'Cannot update'
			render :edit
		end
	end

	private
		def listing_params
			params.require(:listing).permit(:property_name, :location, :pricing, :tag_list, {property_images:[]})
		end

		def find_list
			@list = Listing.find(params[:id])
		end 
end