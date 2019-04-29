# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: "joep")
User.create!(username: "lizp")
User.create!(username: "laylap")
User.create!(username: "loup")

Artwork.create!(title: "artwork1", image_url: "artwork1.jpeg", artist_id: 1)
Artwork.create!(title: "artwork2", image_url: "artwork2.jpeg", artist_id: 2)
Artwork.create!(title: "artwork3", image_url: "artwork3.jpeg", artist_id: 3)
Artwork.create!(title: "artwork4", image_url: "artwork4.jpeg", artist_id: 4)
Artwork.create!(title: "artwork5", image_url: "artwork5.jpeg", artist_id: 1)

ArtworkShare.create!(viewer_id: 1, artwork_id: 3)
ArtworkShare.create!(viewer_id: 1, artwork_id: 2)
ArtworkShare.create!(viewer_id: 1, artwork_id: 4)
ArtworkShare.create!(viewer_id: 2, artwork_id: 1)
ArtworkShare.create!(viewer_id: 2, artwork_id: 3)
ArtworkShare.create!(viewer_id: 2, artwork_id: 4)
ArtworkShare.create!(viewer_id: 3, artwork_id: 1)
ArtworkShare.create!(viewer_id: 3, artwork_id: 2)
ArtworkShare.create!(viewer_id: 4, artwork_id: 1)
ArtworkShare.create!(viewer_id: 4, artwork_id: 3)
ArtworkShare.create!(viewer_id: 4, artwork_id: 5)

Comment.create!(user_id: 1, artwork_id: 2, body: "Nice!!")
Comment.create!(user_id: 2, artwork_id: 4, body: "Awesome!!")
Comment.create!(user_id: 3, artwork_id: 1, body: "Amazing!!")
Comment.create!(user_id: 4, artwork_id: 3, body: "Great!!")

Like.create!(user_id: 3, like_id: 1, like_type: "Artwork")
Like.create!(user_id: 1, like_id: 2, like_type: "Artwork")
Like.create!(user_id: 2, like_id: 1, like_type: "Artwork")
Like.create!(user_id: 1, like_id: 3, like_type: "Artwork")
Like.create!(user_id: 1, like_id: 3, like_type: "Comment")
Like.create!(user_id: 4, like_id: 2, like_type: "Comment")
Like.create!(user_id: 2, like_id: 1, like_type: "Comment")
Like.create!(user_id: 2, like_id: 4, like_type: "Comment")
