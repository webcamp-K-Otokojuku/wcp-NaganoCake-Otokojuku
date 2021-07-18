class ShoppingAddressesController < ApplicationController
  def index
    @shoppingaddress = ShoppingAddress.all
  end
  
  def new
    @shoppingaddress = ShoppingAddress.new
  end
  
  def create
    @shoppingaddress = ShoppingAddress.new
    @shoppingaddress.customer_id = current_user.id
    @shoppingaddress.save
    redirect_to shopping_addresses_path
  end
  
  
end
