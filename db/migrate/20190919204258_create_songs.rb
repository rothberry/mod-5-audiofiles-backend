class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :user_id # Artist
      t.string :genre
      t.integer :number_of_plays
      t.text :description

      t.timestamps
    end
  end
end
