class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :memberships
has_many :communities, through: :memberships
has_many :editable_communities, foreign_key: 'user_id', class_name: 'Community'
has_many :articles

def name
  "#{email}"
end
end
