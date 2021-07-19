class Admin::ItemsController < ApplicationController
  # ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :status, :introduction, :item_image_id, :genre_id)
  end
end
