class AddColumnsToPlaylistsSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists_songs, :position, :integer
  end
end
