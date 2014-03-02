class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :pack_items
  has_one :ordered_pack
  has_one :order, through: :ordered_pack
end
