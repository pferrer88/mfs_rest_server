class Customer < ActiveRecord::Base
  has_many :contracts
  has_many :locations
  attr_accessible :code, :groupCode, :name
end
