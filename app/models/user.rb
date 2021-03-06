class User < ActiveRecord::Base
  extend FriendlyId


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  friendly_id :name, use: :slugged

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        # user.password = Devise.friendly_token[0,20]
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


  #def name
   # "#{email}"
  #end

  # Community is either an number or a Comunity Object
  def member_of? community
    if community.is_a? Numeric
      self.communities.where(id: community).any?
    else
      self.communities.where(id: community.id).any?
    end
  end

  def article_for community, published = false
    community.articles.where(user_id: self.id, published: published).last
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
