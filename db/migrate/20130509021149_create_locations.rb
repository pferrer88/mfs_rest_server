class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :customer
      t.references :destination
      t.references :contact
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :postalCode
      t.boolean :isActive
      t.date :lastModifiedOn
      t.date :lastModifiedBy

      t.timestamps
    end
    add_index :locations, :customer_id
    add_index :locations, :destination_id
    add_index :locations, :contact_id
  end
end
