class Admin::OrdersController < ApplicationController
# ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
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
