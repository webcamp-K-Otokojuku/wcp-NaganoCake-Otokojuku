class Admin::ItemsController < ApplicationController
  # ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :price, :status, :introduction, :item_image, :genre_id)
  end
end
