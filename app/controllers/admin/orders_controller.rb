class Admin::OrdersController < ApplicationController
# ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  # https://qiita.com/taro03/items/ee4cba199e54dd0fe7b1
  def update
    @order = Order.find(params[:id])
    status = params[:order] [:status].to_i
    @order.update(status: status)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
