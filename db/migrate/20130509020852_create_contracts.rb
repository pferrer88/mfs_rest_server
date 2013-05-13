class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :customer
      t.references :location
      t.date :earliestCurrentServiceDate

      t.timestamps
    end
    add_index :contracts, :customer_id
    add_index :contracts, :location_id
  end
end
