class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :property_images, PropertyImageUploader
	acts_as_taggable
	searchkick
	
	def search_data
	 {
	 	user_id: user,
	 	property_name: property_name,
	 	location: location,
	 	tag_list: tags
	 }
	end
end
