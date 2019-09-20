class CreateSongTags < ActiveRecord::Migration[5.2]
  def change
    create_table :song_tags do |t|
      t.integer :song_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
