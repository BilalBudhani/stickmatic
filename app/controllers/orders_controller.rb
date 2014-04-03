class OrdersController < ApplicationController
  def index
    @order = Order.unpaid(current_user).first
  end
end
