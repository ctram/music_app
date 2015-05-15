class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :recording_type,
    inclusion: {in: %w(Live Studio)}
  validates :band_id, presence: true

  belongs_to(
    :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    dependent: :destroy,
    class_name: 'Track',
    foreign_key: :album_id,
    primary_key: :id
  )

end
