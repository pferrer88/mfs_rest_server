class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :location
      t.string :title
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
    add_index :contacts, :location_id
  end
end
