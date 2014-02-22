class PacksController < ApplicationController

  before_filter :instagram_client, only: [:new, :edit]

  def new
    @pack = Pack.new
    (pack_length - @pack.pack_items.length).times {@pack.pack_items.build}
  end

  def create
    @pack = Pack.new(pack_params)
    @pack.user_id = current_user.id
    if @pack.save!
      @cart.add(@pack, @pack.price)
      flash[:success] = "Pack added to cart"
      redirect_to new_pack_path
    else
      redirect_to new_pack_path
    end
  end

  def edit
    @pack = Pack.find(params[:id])
    (pack_length - @pack.pack_items.length).times { @pack.pack_items.build }
  end

  def update
  end

  private
  def pack_params
    params.require(:pack).permit(pack_items_attributes: [:instagram_id,:instagram_image_url])
  end

  def pack_length
    9
  end
end
