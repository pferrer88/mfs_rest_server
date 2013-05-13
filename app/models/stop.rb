class Stop < ActiveRecord::Base
  belongs_to :route
  belongs_to :contract
  has_many :contract_services, :through => :contract
  attr_accessible :completeDT, :isComplete, :sequence
end
