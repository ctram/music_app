class CreateBandsAlbumsTracks < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :albums do |t|
      t.string :title, null: false
      t.string :recording_type
      t.integer :band_id

      t.timestamps
    end

    create_table :tracks do |t|
      t.integer :album_id
      t.string :track_type

      t.timestamps
    end
  end
end
