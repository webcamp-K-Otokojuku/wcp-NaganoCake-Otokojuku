class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    order_items = order_item.order.order_items
    order = order_item.order
    if order_items.where(status: '製作中').any?
      order.update(status: '製作中')
    elsif order_items.where(status: '制作完了').any?
      order.update(status: '発送準備中')
    end
    redirect_to admin_order_path(order_item.order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end

end


