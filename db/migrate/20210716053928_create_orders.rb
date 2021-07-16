class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.string :postcode
      t.string :name
      t.string :address
      t.integer :status
      t.integer :total_price
      t.integer :fee
      t.integer :pay_way
      t.integer :customer_id

      t.timestamps
    end
  end
end
