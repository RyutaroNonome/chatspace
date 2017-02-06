class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages, dependent: :delete_all

  def self.incremental_search(keyword, current_user)
    where('name LIKE(?)', "#{keyword}%").where.not(id: current_user.id)
  end

end