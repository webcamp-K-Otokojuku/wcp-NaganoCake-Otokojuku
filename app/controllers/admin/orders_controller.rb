class Admin::OrdersController < ApplicationController
# ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).reverse_order

  end

  def show
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
