class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :destroy]

  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = current_user.contributions

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
    @contribution = current_user.contributions.new(contribution_params)
    if @contribution.save 
      # adds the contribution amount to the current total in gift
      specificGift = Gift.find(@contribution.gift_id)
      current_total = specificGift.current_total + @contribution.amount
      specificGift.update(:current_total => current_total)

      # allows the gift to be paid now
      if specificGift.current_total >= specificGift.price
        specificGift.update(:can_fund => true)
      end
      
      redirect_to dashboard_path
    else
      redirect_to new_contribution_path
    end
  end

  # PATCH/PUT /contributions/1
  # PATCH/PUT /contributions/1.json
  def update
    #  STRIPE PARAMS
    #  FIND CORRECT CONTRIBUTION
    @contribution = Contribution.find(params[:contribution][:id])
    @contribution.update(stripe_params)
    Stripe.api_key = @contribution.gift.user.access_code

    if @contribution
      # CHARGE CARD HERE
      customer = Stripe::Customer.create(
          :email => @contribution.stripeEmail,
          :card  => @contribution.stripeToken
        )
      charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @contribution.amount.to_i,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
      )
      @contribution.update(:paid => true)
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
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
    def stripe_params
      params.permit(:stripeToken, :stripeTokenType, :stripeEmail)
      # params.require(:contribution).permit(:user_id, :gift_id, :amount)
    end

    def contribution_params
      params.require(:contribution).permit(:gift_id, :amount)
    end
end
