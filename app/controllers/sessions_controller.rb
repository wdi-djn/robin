class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)

    if @user
      sign_in(@user)
      
      # Redirects user to previous page unless coming from home
      if request.referer
        uri = URI(request.referer)
        if uri.path == root_path || new_user_path
          # change redirect to dashboard 
          redirect_to users_path
        else
          # redirect to where user came from
          redirect_to request.referer
        end
      end

    else
      flash[:error] = 'Could not match email and password'
      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out
    # change redirect path to landingpage
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
