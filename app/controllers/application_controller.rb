class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_cart


  # 管理者側と顧客側のログイン後遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Admin
  #     new_admin_session_path
  #   when Customer
  #     root_path
  #   end
  # end
  
  def current_cart
    if session[:cart_item_id]
      @cart = CartItem.find(session[:cart_item_id])
    else
      @cart = CartItem.create
      session[:cart_item_id] = @cart.id
    end
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postcode, :tel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postcode, :tel])
  end


end
