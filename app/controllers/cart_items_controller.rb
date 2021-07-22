class CartItemsController < ApplicationController
 
  def index
    @cart_items = current_customer.cart_items
  end

  def add_item
    item = Item.find(params[:cart_item][:item_id])
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.item_id = item.id
    cart = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart.present?
      cart.quantity += params[:cart_item][:quantity].to_i
      cart.save
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart = CartItem.find(params[:id])
    # cart_item = current_customer.cart_items.find_by(item_id: cart.item_id)
    cart.destroy
    redirect_to cart_items_path
  end
  
  def all_destroy
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
