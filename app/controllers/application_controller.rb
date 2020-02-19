class ApplicationController < ActionController::Base
  include Pundit

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => :internal_server_error
  end

  before_action :authenticate_user!
  after_action :verify_authorized, unless: :devise_controller?

  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  #   devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  # end

  def require_admin!
    return if current_user&.admin?
    flash[:alert] = '管理者以外はアクセスできません。'
    redirect_to root_path
  end
end
