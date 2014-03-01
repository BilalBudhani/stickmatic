class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :instagram_client, only: [:new, :edit]

  def new
    @product = Product.new
    (product_length - @product.product_items.length).times {@product.product_items.build}
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      @cart.add(@product, @product.price)
      flash[:success] = "Product added to cart"
    end
    redirect_to new_product_path
  end

  def edit
    @product = Product.find(params[:id])
    (product_length - @product.product_items.length).times { @product.product_items.build }
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes!(product_params)
      flash[:success] = "Product updated"
    end
    redirect_to edit_product_path
  end

  private
  def product_params
    params.require(:product).permit(:product_items_attributes=>[:instagram_image_id,:instagram_image_url,:id,:product_id])
  end

  def product_length
    9
  end
end
