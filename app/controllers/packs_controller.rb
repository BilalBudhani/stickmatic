class PacksController < ApplicationController
  before_filter :facebook_client, only: [:new, :edit]
  before_filter :fetch_order

  def new
    @pack = Pack.new
    (pack_items_length - @pack.pack_items.length).times {@pack.pack_items.build}
  end

  def create
    @pack = current_user.packs.new(pack_params)
    if @pack.save!
      Order.add(@pack)
      redirect_to basket_path, success: "Pack added to cart"
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
    begin
      @pack = current_user.packs.find(params[:id])
      if @pack.update_attributes!(pack_params)
        redirect_to basket_path, success: 'Pack Updated'
      else
        redirect_to edit_pack_path, error: "Problem updating pack"
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to new_pack_path
    end
  end

  private
  def pack_params
    params.require(:pack).permit(:pack_items_attributes=>[:pack_id, :uid,:image,:thumb])
  end

  def pack_items_length
    9
  end
end
