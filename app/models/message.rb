class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # bodyがカラでないことを検証する。
  validates :body, presence: true
  mount_uploader :image, ImageUploader
end