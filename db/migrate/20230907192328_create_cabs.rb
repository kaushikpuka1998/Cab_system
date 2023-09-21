class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.string :licence_number
      t.string :brand
      t.string :color
      t.string :size
      t.boolean :availability
      t.integer :driver_id

      t.timestamps
    end
  end
end
