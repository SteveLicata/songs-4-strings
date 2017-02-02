class CreateChords < ActiveRecord::Migration[5.0]
  def change
    create_table :chords do |t|
      t.integer :user_id
      t.string :code
      t.string :image_url
      t.string :name

      t.timestamps
    end
  end
end
