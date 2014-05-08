class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates  :provider, :username, :uid, :token, presence: true
  has_many :invitations, :class_name => User.to_s, foreign_key: :invited_by_id
  has_one :invited_by, :class_name => User.to_s, foreign_key: :id

  has_many :packs
  has_many :orders
  before_create :set_initial_data

  has_many :identities , dependent: :destroy

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


  def self.find_for_oauth(auth)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    user = identity.user
    if user.nil?

      # Get the existing user from email if the OAuth provider gives us an email
      user = User.where(:email => auth.info.email).first if auth.info.email

      # Create the user if it is a new registration
      if user.nil?
        user = User.new(
          name: auth.info.name,
          provider: auth.provider,
          uid: auth.uid,

          username: auth.info.nickname || auth.uid,
          image: auth.info.image,# assuming the user model has an image
          token: auth.credentials.token,

          email: auth.info.email.blank? ?  "#{auth.uid}@#{auth.provider}.com" : auth.info.email,
          password: Devise.friendly_token[0,20]
        )
        # user.skip_confirmation!
        user.save!
      end

      # Associate the identity with the user if not already
      if identity.user != user
        identity.user = user
        identity.save!
      end
    end
    user
  end

  private
  def set_initial_data
    self.invite_code ||= SecureRandom.hex(8)
  end

end
