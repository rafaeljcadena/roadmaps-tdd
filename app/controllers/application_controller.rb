class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_locale, :unless => :is_json
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :html, :json

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :name, :email, :password, :password_confirmation, :profile_picture) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :profile_picture) }
  end

  def is_json
    request.format == :json
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
      format.json { render json: {error: :access_denied}, status: 403 }
    end
  end

  def set_locale
    I18n.locale = params[:locale] || (current_user && !current_user.locale.blank? ? current_user.locale : false) || I18n.default_locale
    # current_user.update_attributes locale: I18n.locale.to_s if current_user and I18n.locale.to_s != current_user.locale
  end

  def default_url_options(options={})
    { :locale => (current_user && current_user.locale ? current_user.locale : false) || params[:locale] || I18n.default_locale }
  end
end
