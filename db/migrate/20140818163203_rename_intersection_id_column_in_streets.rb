class RenameIntersectionIdColumnInStreets < ActiveRecord::Migration
  def change
    rename_column :streets, :intersection_osm_id, :intersection_osm
  end
end
