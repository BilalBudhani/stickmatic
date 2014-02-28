class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:select]

  def index
    redirect_to new_product_path if current_user
  end
end
