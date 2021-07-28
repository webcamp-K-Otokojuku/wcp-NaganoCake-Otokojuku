class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @orders = Order.all
    @shopping_addresses = current_customer.shopping_addresses.all
  end

  def confirm
    customer = current_customer
    @cart_items = current_customer.cart_items.all
    session[:order] = Order.new

    session[:order][:fee] = 800

    total = 0
    @cart_items.each do |cart_item|
      #tax_priceはitemメソッドで定義されている
       total += cart_item.item.tax_price * cart_item.quantity
    end

    session[:order][:total_price] = total + session[:order][:fee]
    session[:order][:status] = 0
    session[:order][:customer_id] = current_customer.id

    select_addresses = params[:method_address].to_i

    session[:order][:pay_way] = params[:method_pay_way].to_i
    # byebug
    case select_addresses
    when 0 then
      session[:order][:postcode] = customer.postcode
      session[:order][:name] = customer.last_name + customer.first_name
      session[:order][:address] = customer.address
    when 1 then
      address = ShoppingAddress.find(params[:shopping_address_for_order])
      session[:order][:postcode] = address.postcode
      session[:order][:name] = address.name
      session[:order][:address] = address.address
    when 2 then
      session[:order][:postcode] = params[:postcode]
      session[:order][:name] = params[:name]
      session[:order][:address] = params[:address]
    end

  end

  def create

    order = Order.new(session[:order])
    if order.save
      session.delete(:order)
      @cart_items = current_customer.cart_items.all

      @cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.quantity = cart_item.quantity
        order_item.status = 0
        order_item.include_tax = cart_item.item.tax_price
        order_item.item_id = cart_item.item.id
        order_item.order_id = order.id
        order_item.save
      end
      redirect_to orders_complete_path
    else
      @order = Order.new
      @customer = current_customer
      @orders = Order.all
      @shopping_addresses = current_customer.shopping_addresses.all
      render :new
    end
  end

  def complete
    CartItem.destroy_all
  end

  def index
    @orders = current_customer.orders.all.order(created_at: :desc)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

#   private

# 	def orders_params
# 		params.require(:order).permit(:postcode, :name, :address, :total_price, :fee, :status, :pay_way)
# 	end



end