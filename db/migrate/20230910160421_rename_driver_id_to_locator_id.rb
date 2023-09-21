class RenameDriverIdToLocatorId < ActiveRecord::Migration
  def change
    rename_column :locations, :driver_id, :locator_id
  end
end
