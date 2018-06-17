class AddCountyCodeToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_stations, :county_code, :string
    add_column :stream_stations, :county_code, :string
  end
end
