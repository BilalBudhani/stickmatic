class Address < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :add1, :add2, :city, :state, :zipcode, :landmark, :mobile
  validates :mobile, length: {is: 10}
end
