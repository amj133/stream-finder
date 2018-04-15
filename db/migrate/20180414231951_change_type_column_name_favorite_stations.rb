class ChangeTypeColumnNameFavoriteStations < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorite_stations, :type, :type_of
  end
end
