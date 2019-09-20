class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :location
      t.text :bio
      t.string :img_url
      
      #? Social media Links
      t.string :facebook_url
      t.string :twitter_url
      t.string :soundclound_url

      t.timestamps
    end
  end
end
