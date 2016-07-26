class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :property_images, PropertyImageUploader
	acts_as_taggable
end
