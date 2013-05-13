class Service < ActiveRecord::Base
  has_many :components
  has_many :contract_services
  attr_accessible :code, :description, :isActive, :name, :shortName
end
