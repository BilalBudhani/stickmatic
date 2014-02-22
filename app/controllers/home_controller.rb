class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:select]

  def index
    redirect_to new_pack_path if current_user
  end
end
