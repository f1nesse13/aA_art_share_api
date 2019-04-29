class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "Artists cannot have two artworks with the same title." }
  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: "User"

  has_many :comments, dependent: :destroy,
                      foreign_key: :artwork_id,
                      class_name: "Comment"

  has_many :shares, dependent: :destroy,
                    foreign_key: :artwork_id,
                    class_name: "ArtworkShare"

  has_many :shared_viewers,
    through: :viewers,
    source: :viewer

  has_many :likes, as: :like

  has_many :user_likes,
           through: :likes,
           source: :user

  def self.artworks_shares_and_owned(user_id)
    Artwork.joins(:shares).where("(artwork_shares.viewer_id = :user_id) OR (artworks.artist_id = :user_id)", user_id: user_id).distinct
  end
end
