class CreateIntersections < ActiveRecord::Migration
  def change
    create_table :intersections, id: false do |t|
      t.primary_key :osm
      t.integer :pickups
      t.integer :dropoffs
      t.decimal :latitude, {:precision => 10, :scale => 6}
      t.decimal :longitude, {:precision => 10, :scale => 6}
      t.references :empties
    end
  end
end
