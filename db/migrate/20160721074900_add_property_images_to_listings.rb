class AddPropertyImagesToListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :property_image, :json
    add_column :listings, :property_images, :json
  end
end
