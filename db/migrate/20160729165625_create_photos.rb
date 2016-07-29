class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :vacation, foreign_key: true
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :photo_id

      t.timestamps
    end
  end
end
