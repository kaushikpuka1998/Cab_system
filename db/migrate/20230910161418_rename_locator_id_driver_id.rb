class RenameLocatorIdDriverId < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :locator_id, :driver_id
  end
end
