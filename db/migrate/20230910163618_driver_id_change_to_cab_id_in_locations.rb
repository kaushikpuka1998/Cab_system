class DriverIdChangeToCabIdInLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :driver_id, :cab_id
  end
end
