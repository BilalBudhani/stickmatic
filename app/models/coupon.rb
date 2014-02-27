class Coupon < ActiveRecord::Base

  validates :code , presence: true
  validate :amount_or_percent?

  def amount_or_percent?
    unless self.amount? or self.percent?
      errors.add(:error, "Should have either amount ot percent discount")
    end
  end
end
