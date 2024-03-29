class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    auth = request.env["omniauth.auth"]
    @user = User.find_for_instagram_oauth(auth)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Instagram") if is_navigational_format?
    else
      session["devise.instagram_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  private
  def after_sign_in_path_for(resource)
    auth_done_path
  end

end