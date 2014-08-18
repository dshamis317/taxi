class ChangeDatatypeOfTimeInEmpties < ActiveRecord::Migration
  def change
    remove_column :empties, :time, :time
    add_column :empties, :time, :string
  end
end
