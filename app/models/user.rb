class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks, dependent: :destroy,
                      foreign_key: :artist_id,
                      class_name: "Artwork"

  has_many :shares, dependent: :destroy,
                    foreign_key: :viewer_id,
                    class_name: "ArtworkShare"

  has_many :shared_artwork,
           through: :shares,
           source: :artwork
end
