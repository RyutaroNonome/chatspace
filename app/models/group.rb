class Group < ApplicationRecord
  has_many :group_users
  #dependent_all: :delete_all → 親にあたる投稿を削除したら、子であるコメントを無条件に削除。
  has_many :users, through: :group_users, dependent: :delete_all
  has_many :messages, dependent: :delete_all
end