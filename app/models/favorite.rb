class Favorite < ApplicationRecord
  validates :user_id, :artwork_id, presence: true
  validates :user_id, uniqueness: { scope: :artwork_id, message: "Already favorited!" }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :artwork,
             foreign_key: :artwork_id,
             class_name: "Artwork"
end
