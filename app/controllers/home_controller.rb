class HomeController < ApplicationController
  def index
    redirect_to select_path if current_user
  end

  def select
    @client = Instagram.client(access_token: current_user[:token])
  end
end
