class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  # 管理者側と顧客側のログイン後遷移先
  def after_sign_in_path_for(resource)
    puts "=========="
    p resource
    puts "=========="
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    puts "=========="
    p resource
    puts "=========="
    case resource
    when :admin
      new_admin_session_path
    when :customer
      root_path
    end
  end
  
  
  # def after_inactive_sign_up_path_for(resource)
  #   customers_path
  # end


  #セッションの作成



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postcode, :tel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postcode, :tel])
  end


end
