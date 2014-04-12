class AddressesController < ApplicationController

  before_filter :fetch_order

  def new
    @address = @order.addresses.new
  end

  def create
    @address = @order.addresses.new address_params
    if @address.save
      redirect_to order_success_path
    else
      render 'new'
    end

  end

  private
  def address_params
    params.require(:address).permit(:add1, :add2, :city, :state, :zipcode, :landmark, :mobile)
  end
end
