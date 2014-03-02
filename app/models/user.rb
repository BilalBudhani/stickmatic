class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates  :provider,:username,:uid,:token , presence: true
  has_many :invitations, :class_name => User.to_s, foreign_key: :invited_by_id
  has_one :invited_by, :class_name => User.to_s, foreign_key: :id

  has_many :packs

  before_create :set_initial_data

  def self.find_for_instagram_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = "#{auth.uid}@instagram.com"
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.token = auth.credentials.token
    end
  end

  def set_initial_data
    self.invite_code ||= SecureRandom.hex(8)
  end

end
