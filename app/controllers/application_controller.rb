class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_filter :set_locale

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale if signed_in?

      if params[:locale] == 'en?locale=en'
        I18n.locale = 'en'
      elsif params[:locale] == 'fr?locale=fr'
        I18n.locale = 'fr'
      end
      Rails.application.routes.default_url_options[:locale]= I18n.locale
    end

end
