class CreateFavoriteStations < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_stations do |t|
      t.string :org_id
      t.string :type
      t.text :description
      t.float :latitude
      t.float :longitude
      t.float :drainage_area
      t.string :drainage_area_units
    end
  end
end
