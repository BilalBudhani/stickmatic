class OrdersController < ApplicationController
  before_filter :fetch_order

  def index
    redirect_to new_pack_path unless @order
  end

  def details
    @address = @order.addresses.build
  end
end
