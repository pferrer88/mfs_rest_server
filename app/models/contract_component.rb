class ContractComponent < ActiveRecord::Base
  belongs_to :contract_service
  belongs_to :component
  attr_accessible :chargeCode, :price
end
