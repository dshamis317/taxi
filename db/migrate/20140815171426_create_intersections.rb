class CreateIntersections < ActiveRecord::Migration
  def change
    create_table :intersections do |t|

      t.timestamps
    end
  end
end
