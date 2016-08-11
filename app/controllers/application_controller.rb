class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #if分の:devise_controller?が定義されていないのでbefore_action :configure_permitted_parametersが実行されないのではないかな？
  before_action :configure_permitted_parameters, if: :devise_controller?

  def login_required
    raise Forbidden unless current_member
  end


  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :gender, :birthday, :image]
    devise_parameter_sanitizer.for(:account_update) do |u|
    u.permit(:name, :email, :password, :password_confirmation, :current_password, :image)
   end
 end
 
  #ここインデントおかしいので、以下を参考。doの中身はインデント一つ深くする。
  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) << [:name, :gender, :birthday, :image]
  #  devise_parameter_sanitizer.for(:account_update) do |u|
  #    u.permit(:name, :email, :password, :password_confirmation, :current_password, :image)
  #  end
  #end
end

