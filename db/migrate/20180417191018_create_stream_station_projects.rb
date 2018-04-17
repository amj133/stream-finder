class CreateStreamStationProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :stream_station_projects do |t|
      t.references :stream_station, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
