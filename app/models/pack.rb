class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :pack_items
end
