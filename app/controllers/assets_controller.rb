class AssetsController < ApplicationController

  before_filter :authenticate_user!  #authenticate for users before any methods is called
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  def index
    @assets = current_user.assets
    # respond_with(@assets)
  end

  def show
    @asset = current_user.assets.find(params[:id])
    respond_with(@asset)
  end

  def new
    @asset = current_user.assets.new
    # respond_with(@asset)
  end

  def edit
    @asset = current_user.assets.find(params[:id])
  end

  def create
    @asset = current_user.assets.new(params[:asset])
    @asset.save
    # respond_with(@asset)
  end

  def update
    @asset = current_user.assets.find(params[:id])
    # respond_with(@asset)
  end

  def destroy
    @asset = current_user.assets.find(params[:id])
    # respond_with(@asset)
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(:user_id)
    end
end
