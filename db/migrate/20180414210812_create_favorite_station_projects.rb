class CreateFavoriteStationProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_station_projects do |t|
      t.references :favorite_station, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
