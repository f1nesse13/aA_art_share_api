class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks, dependent: :destroy,
                      foreign_key: :artist_id,
                      class_name: "Artwork"

  has_many :shares, dependent: :destroy,
                    foreign_key: :viewer_id,
                    class_name: "ArtworkShare"

  has_many :comments, dependent: :destroy,
                      foreign_key: :user_id,
                      class_name: "Comment"

  has_many :shared_artwork,
           through: :shares,
           source: :artwork

  has_many :likes,
           foreign_key: :user_id,
           class_name: "Like"

  has_many :liked_artwork,
           through: :likes,
           source: :like,
           source_type: "Artwork"

  has_many :liked_comments,
           through: :likes,
           source: :like,
           source_type: "Comment"
end
