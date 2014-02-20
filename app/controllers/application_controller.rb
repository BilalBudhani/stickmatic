class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def instagram_client
    @client ||= Instagram.client(access_token: current_user[:token])
  end
end
