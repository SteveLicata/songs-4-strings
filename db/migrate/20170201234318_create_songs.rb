class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :title
      t.string :permalink
      t.string :body
      t.string :body_chords_html
      t.string :body_stripped
      t.string :authors
      t.string :chords

      t.timestamps
    end
  end
end
