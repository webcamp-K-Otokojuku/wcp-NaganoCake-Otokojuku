class ApplicationController < ActionController::Base

  # before_action :configure_permitted_parameters, if: :devise_controller?


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

#   protected

#   def configure_permitted_parameters

end
