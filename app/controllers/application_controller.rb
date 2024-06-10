class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "No estás autorizado para realizar esta acción."
    redirect_back(fallback_location: root_path)
  end
end
