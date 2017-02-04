class AddPlaylistnameToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :playlistname, :string
  end
end
