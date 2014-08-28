class Community < ActiveRecord::Base
  belongs_to :winner, class_name: 'User', foreign_key: :user_id
end
