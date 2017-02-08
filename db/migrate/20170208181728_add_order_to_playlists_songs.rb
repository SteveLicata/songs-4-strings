class AddOrderToPlaylistsSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists_songs, :order, :integer
  end
end
