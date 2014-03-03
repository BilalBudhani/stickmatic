class OrdersController < ApplicationController
  def index
    @order = Order.find_by(user: current_user, paid: false)
  end
end
