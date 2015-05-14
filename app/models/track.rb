class Track < ActiveRecord::Base
  validates :album_id, :track_type, presence: true

  belongs_to(
    :album,
    class_name: 'album',
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )
end
