class Track < ActiveRecord::Base
  validates :album_id, :track_type, presence: true
  validates :track_type, inclusion: {in: %w(regular bonus)}

  belongs_to(
    :album,
    class_name: 'Album',
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )
end
