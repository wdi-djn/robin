class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:new]

  # GET /users
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

end
