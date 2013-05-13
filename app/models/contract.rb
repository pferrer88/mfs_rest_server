class Contract < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  has_many :contract_services
  attr_accessible :earliestCurrentServiceDate
end
