class AddPropertyImagesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :property_images, :json
  end
end
