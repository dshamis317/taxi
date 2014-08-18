class ChangeIntegersToBigIntegers < ActiveRecord::Migration
  def change
    remove_column :empties, :total, :integer
    add_column :empties, :total, :bigint
    remove_column :empties, :intersection_osm, :integer
    add_column :empties, :intersection_osm, :bigint
    remove_column :intersections, :osm, :integer
    add_column :intersections, :osm, :bigint
    remove_column :streets, :intersection_osm, :integer
    add_column :streets, :intersection_osm, :bigint
  end
end
