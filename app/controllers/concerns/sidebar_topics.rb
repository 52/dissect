module SidebarTopics
  extend ActiveSupport::Concern

  private

  def load_sidebar_topics
    @topics = Topic.with_published_posts
  end
end
