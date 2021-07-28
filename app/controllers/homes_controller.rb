class HomesController < ApplicationController
  before_action :authenticate_customer!,except: [:top, :about]

  def top
    @genres = Genre.all
    @items = Item.all.order(created_at: :DESC)

  end

  def about
  end
end
