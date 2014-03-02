class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_packs
  has_many :packs, through: :ordered_packs
end
