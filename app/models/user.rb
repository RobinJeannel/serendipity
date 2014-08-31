class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.picture = auth.info.image # assuming the user model has an image
        user.token = auth.credentials.token
        user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  has_many :memberships
  has_many :communities, through: :memberships
  has_many :editable_communities, foreign_key: 'user_id', class_name: 'Community'
  has_many :articles


  def name
    "#{email}"
  end


end
