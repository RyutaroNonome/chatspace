class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # bodyがカラでないことを検証する。
  validates :body, presence: true

    def change_json
    {
      body:     body,
      name:     user.name,
      date:     created_at.strftime('%Y/%m/%d %H:%M:%S'),
    }
  end
end