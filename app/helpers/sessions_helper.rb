module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def signed_in?
    redirect_to sign_in_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by({id: session[:user_id]})
  end

  def sign_out
    @user = session[:user_id] = nil
  end
end
