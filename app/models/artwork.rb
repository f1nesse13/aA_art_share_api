class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "Artists cannot have two artworks with the same title." }
  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: "User"

  has_many :viewers,
    foreign_key: :artwork_id,
    class_name: "ArtworkShare"

  has_many :shared_viewers,
    through: :viewers,
    source: :viewer
end
