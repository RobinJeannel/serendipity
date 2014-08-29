class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  scope :published, -> { where(published: true) }
  scope :by, ->(user) { where(user_id: user.id) }
end
