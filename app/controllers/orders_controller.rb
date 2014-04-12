class OrdersController < ApplicationController
  before_filter :fetch_order

  def index
    redirect_to new_pack_path unless @order
  end

  private
  def address_params
    params.require(:address).permit(:add1, :add2, :city, :state, :zipcode, :landmark, :email)
  end
end
