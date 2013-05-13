class Driver < ActiveRecord::Base
  has_many :routes
  has_many :contract_services
  attr_accessible :code, :name, :username
end
