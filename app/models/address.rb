class Address < ActiveRecord::Base
  validates :city,:street,:country,:pincode, presence: true
  has_one :order
end
