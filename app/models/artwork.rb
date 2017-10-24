class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "artist
    cannot have two pieces of artwork with same namefkaka " }

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User


    has_many(:artwork_shares,
      foreign_key: :artwork_id,
      primary_key: :id,
      class_name: 'ArtworkShare'
      )

    has_many(:shared_viewers,
      through: :artwork_shares,
      source: :viewer
    )
end
