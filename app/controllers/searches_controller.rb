class SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]
    p "============="
    p @value
    p "============="
    datas = search_for(@value)
    @items = datas.page(params[:page]).per(8)
    @genres = Genre.all
  end
  
  private
  
  def search_for(value)
    Item.where("name LIKE ?", "%#{value}%").or(Item.where(genre_id: value))
  end
end
