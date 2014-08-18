class ChangeDecimalsToFloats < ActiveRecord::Migration
  def change
    remove_column :intersections, :latitude, :decimal
    add_column :intersections, :latitude, :float
    remove_column :intersections, :longitude, :decimal
    add_column :intersections, :longitude, :float
  end
end
