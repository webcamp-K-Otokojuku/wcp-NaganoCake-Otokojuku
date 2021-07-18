class CartItemsController < ApplicationController
  def index
    @cart = CartItems.all
  end
  
  def update
  end
  
  def destroy
  end
end
