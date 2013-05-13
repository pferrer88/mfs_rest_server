class Route < ActiveRecord::Base
  belongs_to :driver
  has_many :stops
  attr_accessible :completeDT, :isComplete, :name, :startDT
end
