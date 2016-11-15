class PledgesController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @pledge = @campaign.pledges.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @pledge = @campaign.pledges.new(pledge_params)
    @pledge.user = current_user
    if @pledge.save
      @campaign.current_amount += @pledge.amount
      @campaign.save
      redirect_to @campaign
    else
      render 'new'
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end
