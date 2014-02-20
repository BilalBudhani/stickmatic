class Pack < ActiveRecord::Base
  
  # for staus denoting pack paid or not
  STATUS = [
    PENDING = 0,
    CONFIRMED = 1
  ]

  # type which shows multiple images and single image  
  PACK_TYPES = [
    COLLAGE = 0,
    JIGSAW = 1
  ]

  
  belongs_to :user
  has_many :pack_items , dependent: :destroy
  accepts_nested_attributes_for :pack_items

  def price
    500
  end
  
end
