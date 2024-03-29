class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :pack_items
  has_one :ordered_pack
  has_one :order, through: :ordered_pack
  accepts_nested_attributes_for :pack_items
  validates_presence_of :user_id

  before_validation :add_price


  private
  def add_price
    self.price = 100
  end
end
