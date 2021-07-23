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


  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "入金確認"
      OrderItem.update_all(status: "制作待ち")
      # byebug
    end
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
