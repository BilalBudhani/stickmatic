class OrderedPack < ActiveRecord::Base
  belongs_to :order
  belongs_to :pack

  before_validation :perform_calc


  private
  def perform_calc
    self.total_price = self.qty.to_i * self.pack.price.to_i
  end
end
