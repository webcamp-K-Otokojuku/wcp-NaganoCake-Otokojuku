class ChangeStatusOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :status, :integer, default: '入金待ち'
  end
  
  def down
    change_column :orders, :status, :integer
  end
end
