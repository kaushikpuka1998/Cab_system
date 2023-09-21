class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :gateway
      t.string :invoice_id
      t.integer :amount
      t.integer :status

      t.timestamps
    end
  end
end
