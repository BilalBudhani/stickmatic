class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:select]

  def index
    redirect_to select_path if current_user
  end

  def select
    instagram_client
    @pack = Pack.new
    (9 - @pack.pack_items.length).times {@pack.pack_items.build}
  end
end
