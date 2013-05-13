class CreateContractServices < ActiveRecord::Migration
  def change
    create_table :contract_services do |t|
      t.references :driver
      t.references :contract
      t.references :service
      t.date :earliestCurrentServiceDate

      t.timestamps
    end
    add_index :contract_services, :driver_id
    add_index :contract_services, :contract_id
    add_index :contract_services, :service_id
  end
end
