class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.references :route
      t.references :contract
      t.integer :sequence
      t.boolean :isComplete
      t.date :completeDT

      t.timestamps
    end
    add_index :stops, :route_id
    add_index :stops, :contract_id
  end
end
