class RenameLocatorIdDriverId < ActiveRecord::Migration
  def change
    rename_column :locations, :locator_id, :driver_id
  end
end
