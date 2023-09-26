class AddPlaceIdInLocationTable < ActiveRecord::Migration
  def change
    add_column :locations, :place_id, :integer
  end
end
