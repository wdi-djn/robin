class GiftsController < ApplicationController
  # before_action :signed_in?, except: [:index, :show]
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
    # check if current user has password to view gift
    p "SHOW"
    unless session[@gift_id] = @gift.password
      p "REDIRECT NOW"
      redirect_to gift_password_path(@gift.id)
    end

    @contribution = Contribution.new
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    @gift = current_user.gifts.new(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to @gift, notice: 'Gift was successfully created.' }
        format.json { render :show, status: :created, location: @gift }
      else
        format.html { render :new }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to @gift, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET
  def authenticate
    @gift = Gift.all.find(params[:gift_id])
  end

  # POST
  def password
    # if passwords match, store in session
    p "PASSWORD IS"
    p params[:gift][:password]

    @gift = Gift.all.find(params[:gift_id])
    if params[:gift][:password] == @gift.password
      session[@gift_id] = @gift.password
      redirect_to gift_path(@gift)
    else
      flash[:error] = "Incorrect password"
      redirect_to gift_authenticate_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:title, :description, :price, :due_date, :recipient, :user_id, :hashed_id, :gift_url, :password)
    end
end
