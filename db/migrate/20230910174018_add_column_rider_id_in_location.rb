class AddColumnRiderIdInLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :rider_id, :integer
  end
end
