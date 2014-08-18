class RemoveEmptiesIdFromIntersections < ActiveRecord::Migration
  def change
    remove_column :intersections, :empties_id, :integer
  end
end
