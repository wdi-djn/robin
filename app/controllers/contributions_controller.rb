class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]

  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = Contribution.all
  end

  # GET /contributions/1
  # GET /contributions/1.json
  def show
  end

  # GET /contributions/new
  def new
    @contribution = Contribution.new
  end

  # GET /contributions/1/edit
  def edit
  end

  # POST /contributions
  # POST /contributions.json
  def create
    p 'CREATE CONTRIBUTIONS: should recieve stripe token here'
    @contribution = Contribution.create(contribution_params)


    #secret API KEY here probably have to move it
    Stripe.api_key = "sk_test_ezz3NJ7FuGJhmrQI8Aujneyw"

    # respond_to do |format|
      if @contribution
        # format.html { redirect_to @contribution, notice: 'Contribution was successfully created.' }
        # format.json { render :show, status: :created, location: @contribution }

        p @contribution
                # raise @contribution.inspect
        p @contribution.stripeEmail
          customer = Stripe::Customer.create(
            :email => @contribution.stripeEmail,
            :card  => @contribution.stripeToken
          )
          charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => 2500, #should be @contribution.amount
            :description => 'Rails Stripe customer',
            :currency    => 'usd'
          )


        redirect_to gifts_path
      else
        # format.html { render :new }
        # format.json { render json: @contribution.errors, status: :unprocessable_entity }
        redirect_to gifts_path
      end
    # end
  end

  # PATCH/PUT /contributions/1
  # PATCH/PUT /contributions/1.json
  def update
    respond_to do |format|
      if @contribution.update(contribution_params)
        format.html { redirect_to @contribution, notice: 'Contribution was successfully updated.' }
        format.json { render :show, status: :ok, location: @contribution }
      else
        format.html { render :edit }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.json
  def destroy
    @contribution.destroy
    respond_to do |format|
      format.html { redirect_to contributions_url, notice: 'Contribution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contribution_params
      params.permit(:stripeToken, :stripeTokenType, :stripeEmail)
      # params.require(:contribution).permit(:user_id, :gift_id, :amount)
    end
end
