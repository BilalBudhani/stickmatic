class OrderedPack < ActiveRecord::Base
  belongs_to :order
  belongs_to :pack
end
