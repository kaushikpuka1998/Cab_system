class AddColumnRiderIdInLocation < ActiveRecord::Migration
  def change
    add_column :locations, :rider_id, :integer
  end
end
