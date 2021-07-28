class SearchesController < ApplicationController
  def search
    if params["search"]["genreid"].nil?
      @value = params["search"]["value"]
      datas = search_for(@value)
      @item = @value
    else
      @value = params["search"]["genreid"]
      datas = genre_search_for(@value)
      @item = Genre.find(@value).category
    end
    @items = datas.page(params[:page]).per(8)
    @genres = Genre.all
  end
  
  private
  
  def search_for(value)
    Item.where("name LIKE ?", "%#{value}%")
  end
  
  def genre_search_for(value)
    Item.where(genre_id: value)
  end

  
end
