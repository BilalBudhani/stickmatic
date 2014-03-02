class PackItem < ActiveRecord::Base
  belongs_to :pack
  validates_presence_of :image, :thumb, :uid
end
