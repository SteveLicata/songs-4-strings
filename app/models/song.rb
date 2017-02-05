class Song < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :chords
  has_and_belongs_to_many :playlists

  validates_presence_of :title
end
