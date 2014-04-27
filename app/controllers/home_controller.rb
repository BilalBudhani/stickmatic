class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    redirect_to new_pack_path if current_user
  end

  def tos
  end

  def privacy
  end

  def contact
  end

  def auth_done

  end
end
