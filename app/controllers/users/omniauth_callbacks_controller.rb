class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    oauth_callback('instagram')
  end


  def facebook
      oauth_callback('facebook')
  end

  private

  def oauth_callback(oauth_name)
    @user = User.find_for_oauth(env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => oauth_name.capitalize) if is_navigational_format?
    else
      session["devise.#{oauth_name.downcase}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end