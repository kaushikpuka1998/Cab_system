class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :state
      t.integer :pincode

      t.timestamps
    end
  end
end
