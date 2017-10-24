class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true


  has_many :artworks,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :Artwork

  has_many(:artwork,
    foreign_key: :viewer_id,
    primary_key: :id,
    class_name: 'ArtworkShare'
    )
end
