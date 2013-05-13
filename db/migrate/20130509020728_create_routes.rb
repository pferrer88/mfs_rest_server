class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :driver
      t.string :name
      t.date :startDT
      t.boolean :isComplete
      t.date :completeDT

      t.timestamps
    end
    add_index :routes, :driver_id
  end
end
