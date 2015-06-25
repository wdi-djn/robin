class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def stripe_connect
    @user = current_user

    if @user.update({
      provider: request.env["omniauth.auth"].provider,
      uid: request.env["omniauth.auth"].uid,
      access_code: request.env["omniauth.auth"].credentials.token,
      publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
      })
      redirect_to new_gift_path
    else
      flash[:error] = "We could not connect your Stripe account"
      redirect_to stripe_connect_user_path
    end

  end
end