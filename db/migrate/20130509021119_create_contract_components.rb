class CreateContractComponents < ActiveRecord::Migration
  def change
    create_table :contract_components do |t|
      t.references :contract_service
      t.references :component
      t.float :price
      t.integer :chargeCode

      t.timestamps
    end
    add_index :contract_components, :contract_service_id
    add_index :contract_components, :component_id
  end
end
