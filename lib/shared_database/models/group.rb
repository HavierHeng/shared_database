class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :users, through: :user_groups

  has_many :group_articles
  has_many :articles, through: :group_articles
end
