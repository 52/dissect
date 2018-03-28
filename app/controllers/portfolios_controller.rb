class PortfoliosController < ApplicationController
  before_action :load_portfolio_item, only: [:show, :edit, :update]

  def index
    @portfolio_items = Portfolio.all
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new portfolio_item_params

    respond_to do |format|
      if @portfolio_item.save
        format.html do
          flash[:notice] = "Your portfolio item is now live."
          redirect_to portfolios_url
        end
      else
        format.html{render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update portfolio_item_params
        format.html do
          flash[:notice] = "Your portfolio item is successfully updated!"
          redirect_to portfolios_url
        end
      else
        format.html{render :edit}
      end
    end
  end

  private

  def load_portfolio_item
    @portfolio_item = Portfolio.find params[:id]
  end

  def portfolio_item_params
    params.require(:portfolio).permit :title, :subtitle, :body
  end
end
