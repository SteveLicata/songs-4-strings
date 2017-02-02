class AddChordSearchToChords < ActiveRecord::Migration[5.0]
  def change
    add_column :chords, :chord_search, :string
  end
end
