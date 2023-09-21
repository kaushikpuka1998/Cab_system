class DriverIdChangeToCabIdInLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :driver_id, :cab_id
  end
end
