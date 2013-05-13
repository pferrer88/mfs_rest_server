class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :code
      t.string :name
      t.string :shortName
      t.string :description
      t.boolean :isActive

      t.timestamps
    end
  end
end
