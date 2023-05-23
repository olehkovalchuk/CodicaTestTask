class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_admin

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  private

  def redirect_admin
    if current_user.admin? && params[:controller] != "admin"
      respond_to do |format|
        format.html { redirect_to admin_root_path, alert: "Unauthorized Access!" }
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :phone, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :password, :current_password)}
  end

end
