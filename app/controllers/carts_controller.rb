class CartsController < ApplicationController
  def index
  end

  def update
    if params[:cart_item].present? && params[:cart_item][:quantity].present? && params[:cart_item][:item_id].present?
      quantity = params[:cart_item][:quantity].to_i
      update_cart(@item,quantity) if  quantity > 0 and @item = Pack.find_by_id(params[:cart_item][:item_id])
    end

    respond_to do |format|
      format.html {redirect_to basket_path}
      format.js
    end
  end

  def remove
    if @item = Pack.find_by_id(params[:item_id])
      @cart.remove(@item)
    end
    redirect_to basket_path
  end

  private

  def update_cart(item,quantity)
    @cart.remove(@item)
    @cart.add(item, item.price,quantity)
  end

end
