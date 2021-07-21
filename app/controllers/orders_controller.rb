class OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @orders = Order.all
    @shopping_addresses = current_customer.shopping_addresses.all
  end

  def confirm
    customer = current_customer

    session[:order] = Order.new

    session[:order][:fee] = 800



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
      address = ShoppingAddress.find(params[:shipping_address_for_order])
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
    @order = Order.new(orders_params)
    # byebug
    # order = Order.new(session[:order])
		# Order.build(session[:order])
    #Order.save
		# Order.create(session[:order])
		# session.delete(:order)

    if @order.save
      session.delete(:order)
      redirect_to orders_path
    else
      render :new, @order
    end
  end

  def complete

  end

  def index
    @orders = Order.all
  end

  def show

  end

  private

	def orders_params
		params.require(:order).permit(:id, :postcode, :name, :address, :total_price, :fee, :status, :pay_way, :customer_id)
	end



end

