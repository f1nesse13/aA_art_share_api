class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, message: "This artwork has already been shared with the user." }

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: "User"

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: "Artwork"
end
