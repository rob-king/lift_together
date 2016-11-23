class PledgesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @pledge = @campaign.pledges.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @pledge = @campaign.pledges.new(pledge_params)
    @pledge.user = current_user
    # you could also add the block on lines 15-17 to an after_create method in pledge.rb
    if @pledge.save
      @campaign.current_amount += @pledge.amount
      @campaign.save
      redirect_to @campaign
    else
      flash[:errors] = @pledge.errors.full_messages
      redirect_to new_campaign_pledge_path(@campaign,@pledge)
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end
