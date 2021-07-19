class CartItemsController < ApplicationController
  def index
    @cart = current_customer.cart_items
  end
  
  def update
  end
  
  def destroy
  end
end
