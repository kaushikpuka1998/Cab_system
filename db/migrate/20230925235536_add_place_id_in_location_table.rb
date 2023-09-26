class AddPlaceIdInLocationTable < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :place_id, :integer
  end
end
