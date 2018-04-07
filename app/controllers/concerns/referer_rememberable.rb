module RefererRememberable
  extend ActiveSupport::Concern

  included do
    before_action :remember_referer
  end

  private

  def remember_referer
    session[:referer] = params[:referer] if params[:referer]
  end
end
