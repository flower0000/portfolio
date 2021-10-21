class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   #メソッドはよく:〇〇(シンボル)で管理
   #:configure_permitted_parametersも:devise_controller?もメソッドです

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
