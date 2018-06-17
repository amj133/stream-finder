class AddColumnsToFavoriteStations < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_stations, :name, :string
    add_column :favorite_stations, :huc, :string
    add_column :favorite_stations, :created_at, :datetime, null: false
    add_column :favorite_stations, :updated_at, :datetime, null: false
  end
end
