class RenameDriverIdToLocatorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :driver_id, :locator_id
  end
end
