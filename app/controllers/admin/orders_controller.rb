class Admin::OrdersController < ApplicationController
# ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).order(created_at: :desc).per(10)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end


  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "入金確認"
      order_items = order.order_items
      order_items.update_all(status: "制作待ち")
    end
    redirect_to admin_order_path(order)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

end
