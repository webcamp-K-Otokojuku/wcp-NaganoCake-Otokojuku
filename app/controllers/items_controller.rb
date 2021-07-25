class ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
    @items_count = Item.all
    # 商品の全件数表示のため「@items_count」を定義

  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new

  end


end
