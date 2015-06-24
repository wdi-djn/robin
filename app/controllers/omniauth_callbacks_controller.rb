class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def stripe_connect
    @user = current_user
    binding.pry
    if @user.update({
      provider: request.env["omniauth.auth"].provider,
      uid: request.env["omniauth.auth"].uid,
      access_code: request.env["omniauth.auth"].credentials.token,
      publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
      })
      redirect_to gifts_path
    else
      redirect_to new_gift_path
    end

  end
end