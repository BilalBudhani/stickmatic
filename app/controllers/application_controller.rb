class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  protected
  def instagram_client
    @client ||= Instagram.client(access_token: current_user[:token])
  end

  def order
    current_user.orders.where(paid: false).first_or_initialize
  end
end
