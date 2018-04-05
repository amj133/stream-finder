class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :organization
      t.string :location_id
      t.string :location_name
      t.string :location_type
      t.integer :huc_8
      t.integer :drainage_area_value
      t.string :drainage_area_unit_code
      t.integer :contributing_drainage_area_value
      t.string :contributing_drainage_area_unit_code
      t.string :latitude
      t.string :longitude
      t.string :horizontal_datum
      t.string :vertical_datum
      t.string :state_code
      t.string :county_code
      t.string :aquifer_name
      t.string :formation_type
      t.string :aquifer_type
      t.string :construction_date
      t.string :well_depth_value
      t.string :well_depth_unit_code
      t.string :provider

      t.timestamps
    end
  end
end
