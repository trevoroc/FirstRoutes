# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user1 = User.create(username: "user1")
user2 = User.create(username: "user2")
user3 = User.create(username: "user3")

Artwork.destroy_all
artwork1 = Artwork.create(title: "Blue Canvas", artist_id: user1.id, image_url: "google.com")
artwork2 = Artwork.create(title: "Red Dot", artist_id: user2.id, image_url: "moogle.com")
artwork3 = Artwork.create(title: "Random Paint Splatters", artist_id: user3.id, image_url: "floogle.com")

ArtworkShare.destroy_all
share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
share2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user3.id)
share3 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user1.id)
