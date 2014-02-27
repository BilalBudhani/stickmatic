class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initialize_cart

  protected
  def instagram_client
    @client ||= Instagram.client(access_token: current_user[:token])
  end

  def initialize_cart
    return unless user_signed_in?
    @cart = @cart.presence || Cart.find_by_id(session[:cart_id].to_i).presence || Cart.create(user_id: current_user.id)
    session[:cart_id] = @cart.id
  end
end
