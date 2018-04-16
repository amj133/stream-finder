class CreateMonitoringStations < ActiveRecord::Migration[5.1]
  def change
    create_table :monitoring_stations do |t|
      t.string :org_id
      t.string :name
      t.string :huc
      t.string :type_of
      t.text :description
      t.float :latitude
      t.float :longitude
      t.float :drainage_area
      t.string :drainage_area_units

      t.timestamps
    end
  end
end
