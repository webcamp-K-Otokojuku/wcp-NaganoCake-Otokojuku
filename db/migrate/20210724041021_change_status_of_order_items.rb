class ChangeStatusOfOrderItems < ActiveRecord::Migration[5.2]
  def up
    change_column :order_items, :status, :integer, default: 'ηζδΈε―'
  end

  def down
    change_column :order_items, :status, :integer
  end
end
