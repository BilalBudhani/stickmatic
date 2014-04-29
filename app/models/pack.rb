require 'open-uri'
require 'fileutils'
require "#{Rails.root}/lib/helpers/collage"

class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :pack_items
  has_one :ordered_pack
  has_one :order, through: :ordered_pack
  accepts_nested_attributes_for :pack_items
  validates_presence_of :user_id

  before_validation :add_price

  TMP_PATH = "#{Rails.root}/tmp/images/packs"


  def draw!
    Collage.new.draw_collage(download_pack_images,collage_path)
    #FIXME
    self
  end

  def collage_path
    "#{tmp_folder_for_pack}/#{self.id}.jpg"
  end


  private

  def tmp_folder_for_pack
    "#{TMP_PATH}/#{self.id}"
  end




  def add_price
    self.price = 100
  end

  def download_pack_images

    images = []

    # create parent dir of does not exist
    FileUtils.mkdir_p tmp_folder_for_pack

    # download images to temp folder
    self.pack_items.to_a.each_with_index do |pack_item,index|
      tmp_image = "#{tmp_folder_for_pack}/#{index}.jpg"

      # save image to return images array
      images << tmp_image

      # download file if does not exist
      unless File.exist?(tmp_image)
        download_file(pack_item.image,tmp_image)
      end

    end
    images
  end

  def download_file(src,destination)
    open(destination, 'wb') do |file|
      file << open(src).read
    end
  end
end
