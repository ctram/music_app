class Note < ActiveRecord::Base
  validates_presence_of :user_id, :album_id, :body
  
  belongs_to :track
  belongs_to :author, class_name: 'User's
end
