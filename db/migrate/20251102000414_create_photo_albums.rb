class CreatePhotoAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_albums do |t|
      t.integer :genre_id

      t.timestamps
    end
  end
end
