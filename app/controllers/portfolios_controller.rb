class PortfoliosController < ApplicationController
  SUBTITLES = %w(angular ruby_on_rails).freeze
  before_action :load_portfolio_item, only: [:show, :edit, :update, :destroy]

  access all:        [:index, :show, :list_by_subtitle],
         user:       {except: [:new, :edit, :create, :update, :destroy]},
         site_admin: :all

  def index
    @portfolio_items = Portfolio.all
  end

  # GET /portfolios/angular
  # GET /portfolios/ruby-on-rails
  # List portfolio items by subtitle
  def list_by_subtitle
    subtitle = params[:subtitle].downcase.tr "-", "_"
    if SUBTITLES.include? subtitle
      @title = "#{subtitle.titleize} Portfolio Items"
      @portfolio_items = Portfolio.send subtitle
      render :index
    else
      redirect_to portfolios_url
    end
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times{@portfolio_item.technologies.build}
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

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      format.html do
        redirect_to portfolios_url, notice: "Portfolio item was removed."
      end
    end
  end

  private

  def load_portfolio_item
    @portfolio_item = Portfolio.find params[:id]
  end

  def portfolio_item_params
    params.require(:portfolio).permit :title, :subtitle, :body,
                                      technologies_attributes: [:id, :name]
  end
end
