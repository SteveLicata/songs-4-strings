class RemovePositionFromPlaylistsSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :playlists_songs, :position
  end
end
