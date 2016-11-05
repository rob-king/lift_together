class CampaignsController < ApplicationController
  def index
  end

  def show
    @campaign =  Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create!(campaign_params)
    redirect_to @campaign
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)
    redirect_to @campaign
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name,
      :description,
      :organization,
      :end_date,
      :goal_amount)
  end
end
