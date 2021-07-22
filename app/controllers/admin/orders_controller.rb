class Admin::OrdersController < ApplicationController
# ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.total_price = 100
  end

  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
