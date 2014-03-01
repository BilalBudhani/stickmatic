class Order < ActiveRecord::Base

  validates :user,:address,:transaction_id, :action , presence: true

  belongs_to :address
  belongs_to :user

  has_many :order_carts
  has_many :carts , through: :order_carts

  def init
    self.transaction_id = SecureRandom.hex(16) + Time.now.to_i.to_s if self.new_record?
  end


end
