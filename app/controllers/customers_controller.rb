class CustomersController < ApplicationController

  def show

  end

  def edit
  # 　@customer = Customer.find(current_customer)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def hide

  end
  
  def withdrawal
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postcode, :tel)
  end
end
