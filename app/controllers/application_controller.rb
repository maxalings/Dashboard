class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_navbar

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  # This method overrides Rails.application.default_url_options[:host] to add an absolute URL to meta tags, good for SEO
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def check_navbar
    @show_navbar = params[:controller] == "pages" ||
      (params[:controller] == "devise/registrations" && params[:action] ==  "new") ||
      params[:controller] == "devise/sessions"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
