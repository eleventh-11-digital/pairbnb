class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :property_name
      t.string :location
      t.integer :user_id
      t.integer :pricing

      t.timestamps null: false
    end
  end
end