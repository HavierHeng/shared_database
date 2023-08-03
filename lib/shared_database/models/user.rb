class User < ActiveRecord::Base
  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :feedbacks
  has_many :articles, through: :feedbacks
end
