class CreateShoppingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_addresses do |t|
      
      t.string :name
      t.string :address
      t.string :postcode
      t.integer :customer_id
      

      t.timestamps
    end
  end
end
