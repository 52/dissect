class TopicsController < ApplicationController
  include SidebarTopics
  layout "blogs"

  before_action :load_sidebar_topics

  def show
    @topic = Topic.friendly.find params[:id]

    if logged_in? :site_admin
      @blogs = @topic.blogs.page(params[:page]).per 3
    else
      @blogs = @topic.blogs.published.page(params[:page]).per 3
    end
  end
end
