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

end
