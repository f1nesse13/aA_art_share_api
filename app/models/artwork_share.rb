class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, message: "This artwork has already been shared with the user." }
  validate :share_with_owner

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: "User"

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: "Artwork"

  def share_with_owner
    if self.viewer_id == self.artwork.artist_id
      self.errors[:viewer_id] << "Cannot share artwork with the artist!"
    end
  end

  def favorite?
    self.favorite == true
  end
end
