class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|

      t.timestamps
    end
  end
end
