class RenameIntersectionIdColumnInEmpties < ActiveRecord::Migration
  def change
    rename_column :empties, :intersection_osm_id, :intersection_osm
  end
end
