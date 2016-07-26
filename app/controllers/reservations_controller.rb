class ReservationsController < ApplicationController
before_action :find_reservation, only: [:show, :destroy, :update]

def new
	@reservation = Reservation.new
end

def create
	@reservation = current_user.reservations.new(reservation_params)
	if @reservation.save
		flash[:msg] = "Success to Booking!"
		ReservationJob.perform_later(@reservation)
		redirect_to reservation_path(@reservation.id)
	else
		flash[:msg] = "Please try another date!!"
		@listing = Listing.find(@reservation.listing_id)
		@reservation = Reservation.new
		render 'listings/show'
	end
end

def show
	@user = User.find(current_user.id)
	@reservations = @user.reservations
end

def edit
	@reservation = Reservation.find(params[:id])
end

def update
	if @reservation.update(reservation_params)
		flash[:msg] = "Update Done!!"
		redirect_to user_path(current_user.id)
	else
		flash[:msg] = "Please try again to edit ur Reservation"
		render :edit
	end
end

def destroy
	@reservation = Reservation.find(params[:id])
	@reservation.destroy
	flash[:msg] = "Success to cancel Booking"
	redirect_to user_path(current_user.id)
end

def index
	@reservations = Reservation.find_by(listing_id: params[:listing_id])
end

private
	def reservation_params
		params.require(:reservation).permit(:listing_id, :user_id, :start_date, :end_date)
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end
end