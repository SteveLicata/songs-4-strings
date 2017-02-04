class RemoveNameFromPlaylists < ActiveRecord::Migration[5.0]
  def change
    remove_column :playlists, :name, :string
  end
end
