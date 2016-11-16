class CampaignsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign =  Campaign.find(params[:id])
    @pledges = @campaign.pledges
  end

  def edit
    @campaign = Campaign.find(params[:id])
    if @campaign.user != current_user
      flash[:errors] = []
      flash[:errors] << "Only the Campaign's creator can edit a campaign."
      redirect_to @campaign
    end
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    @campaign.current_amount = 0
    if @campaign.save
      redirect_to @campaign
    else
      render 'new'
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.user = current_user
    if @campaign.update(campaign_params)
      redirect_to @campaign
    else
      render 'edit'
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    if @campaign.user == current_user
      @campaign.destroy
      redirect_to campaigns_path
    else
      flash[:errors] = "Only the creator of the campaign can delete it."
      redirect_to @campaign
    end
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
