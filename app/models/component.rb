class Component < ActiveRecord::Base
  belongs_to :service
  has_many :contract_components
  attr_accessible :code, :description, :isActive, :name, :shortName, :uomCode, :uomUnit
end
