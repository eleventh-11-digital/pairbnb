class ReservationMailer < ApplicationMailer
	def booking_email(reservation)
		@reservation = reservation
		@user = @reservation.user
		@listing = @reservation.listings
    	mail(to: @user.email, subject: 'Your Property been Booked!')
	end
end
