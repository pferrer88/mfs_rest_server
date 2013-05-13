class ContractService < ActiveRecord::Base
  belongs_to :driver
  belongs_to :contract
  belongs_to :service
  has_many :contract_components
  attr_accessible :earliestCurrentServiceDate
end
