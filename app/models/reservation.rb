class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listings
	validates :start_date, :end_date, :overlap => {:scope => "listing_id"}
	validates :start_date, presence: true, :timeliness => {:after => lambda { DateTime.now }}
	validates :end_date, presence: true, :timeliness => {:after => lambda { :start_date }}

end
