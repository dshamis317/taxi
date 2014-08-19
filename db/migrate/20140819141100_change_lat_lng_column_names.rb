class ChangeLatLngColumnNames < ActiveRecord::Migration
  def change
    rename_column :intersections, :latitude, :lng
    rename_column :intersections, :longitude, :latitude
    rename_column :intersections, :lng, :longitude
  end
end
