class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def stripe_connect
  end

  def stripe_disconnect
    current_user.update(:publishable_key => nil, :provider => nil, :uid => nil, :access_code => nil)
    redirect_to show_user_path(current_user)
  end
end
