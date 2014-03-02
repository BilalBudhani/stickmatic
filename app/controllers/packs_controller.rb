class PacksController < ApplicationController
  before_filter :instagram_client, only: [:new, :edit]

  def new
    @pack = Pack.new
    (pack_items_length - @pack.pack_items.length).times {@pack.pack_items.build}
  end

  def create
    @pack = current_user.packs.new(pack_params)
    if @pack.save!
      flash[:success] = "Product added to cart"
      redirect_to basket_path
    else
      redirect_to new_pack_path
    end
  end

  def edit
    begin
      @pack = current_user.packs.find(params[:id])
      (pack_items_length - @pack.pack_items.length).times { @pack.pack_items.build }
    rescue ActiveRecord::RecordNotFound
      redirect_to new_pack_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes!(product_params)
      flash[:success] = "Product updated"
    end
    redirect_to edit_product_path
  end

  private
  def pack_params
    params.require(:pack).permit(:pack_items_attributes=>[:pack_id, :uid,:image,:thumb])
  end

  def pack_items_length
    9
  end
end
