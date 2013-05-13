class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.references :service
      t.string :code
      t.string :name
      t.string :shortName
      t.string :description
      t.boolean :isActive
      t.string :uomCode
      t.string :uomUnit

      t.timestamps
    end
    add_index :components, :service_id
  end
end
