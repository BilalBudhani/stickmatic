class ProductItem < ActiveRecord::Base
  belongs_to :product

  before_save :check_image

  def check_image
  	if self.instagram_image_thumb_url.blank? && self.instagram_image_url?
  		self.instagram_image_thumb_url = self.instagram_image_url
  	elsif self.instagram_image_url.blank? && self.instagram_image_thumb_url?
  		self.instagram_image_url = self.instagram_image_thumb_url
  	end
  end 
end
