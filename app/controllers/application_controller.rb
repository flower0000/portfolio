class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
   #メソッドはよく:〇〇(シンボル)で管理
   #:configure_permitted_parametersも:devise_controller?もメソッドです

  #ログイン後の遷移先
  def after_sign_in_path_for(resource)
    root_path
  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
