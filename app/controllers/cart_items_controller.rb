class CartItemsController < ApplicationController
  def index
    @cart = current_cart.cart_items
  end
  
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end
  
  def update
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end
  
  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end
end
