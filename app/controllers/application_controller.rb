class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
 include SessionsHelper
around_action :switch_locale
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  private 
  def login_first!
    if !logged_in?
      redirect_to new_session_path
    end
  end
  
end
