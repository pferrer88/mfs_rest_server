class Location < ActiveRecord::Base
  belongs_to :customer
  belongs_to :destination
  # belongs_to :contact
  has_many :contacts
  has_many :contracts
  attr_accessible :address1, :address2, :city, :isActive, :lastModifiedBy, :lastModifiedOn, :name, :postalCode, :state
end
