class OrdersController < ApplicationController
  before_filter :fetch_order

  def index
  end

  def details
    @address = @order.addresses.build
  end
end
