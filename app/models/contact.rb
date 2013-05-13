class Contact < ActiveRecord::Base
  belongs_to :location
  attr_accessible :email, :name, :phone, :title
end
