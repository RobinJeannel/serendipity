class Community < ActiveRecord::Base
  belongs_to :winner, class_name: 'User', foreign_key: :user_id
  has_many :articles
  has_many :memberships
  has_many :users, through: :memberships

end
