class CartsController < ApplicationController
  def index
  end
  def remove
    if @pack = Pack.find_by_id(params[:item_id])
      @cart.remove(@pack)
    end
  end
end
