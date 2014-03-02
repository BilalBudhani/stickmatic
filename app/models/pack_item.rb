class PackItem < ActiveRecord::Base
  belongs_to :pack
  validates_presence_of :pack_id, :image, :thumb, :uid
end
