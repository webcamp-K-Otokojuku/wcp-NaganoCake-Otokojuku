class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(created_at: :DESC)
  end

  def about
  end
end
