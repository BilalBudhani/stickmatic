class PacksController < ApplicationController
  def create
    @pack = Pack.new(pack_params)
    @pack.user_id = current_user.id
    if @pack.save!
      @cart.add(@pack, @pack.price)
      flash[:success] = "Pack added to cart"
      redirect_to select_path
    else
      redirect_to select_path
    end
  end

  def edit
    instagram_client
    @pack = Pack.find(params[:id])
    (9 - @pack.pack_items.length).times {@pack.pack_items.build}
  end

  def update
    @pack = Pack.find(params[:id])
    # @pack.user_id = current_user.id
    if @pack.update_attributes!(pack_params)
      # @cart.add(@pack, @pack.price)
      flash[:success] = "Pack added to cart"
      redirect_to select_path
    else
      redirect_to select_path
    end
  end

  def pack_params
    params.require(:pack).permit(:pack_items_attributes=>[:instagram_image_id,:instagram_image_url,:id,:pack_id])
  end
end
