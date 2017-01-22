class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # bodyがから出ないことを検証する。
  validates :body, presence: true
end