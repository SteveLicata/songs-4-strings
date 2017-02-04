class RemoveChordsFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :chords, :string
  end
end
