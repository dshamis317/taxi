class CreateEmpties < ActiveRecord::Migration
  def change
    create_table :empties do |t|
      t.time :time
      t.integer :total
      t.references :intersection_osm
    end
  end
end
