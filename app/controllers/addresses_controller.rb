class AddressesController < ApplicationController

  before_filter :fetch_order

  def new
    @address = @order.addresses.new
  end

  def create
    @address = @order.addresses.build(address_params)
    if @order.save
      redirect_to charging_request_charging_index_path(order_id: @order.id)
    else
      render 'new'
    end

  end

  private
  def address_params
    params.require(:address).permit(:add1, :add2, :city, :state, :zipcode, :landmark, :mobile)
  end
end
