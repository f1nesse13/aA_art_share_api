class Like < ApplicationRecord
  validates :like_type, :like_id, presence: true

  belongs_to :like, polymorphic: true

  belongs_to :user,
             foreign_key: :user_id,
             class_name: "User"
end
