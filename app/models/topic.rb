class Topic < ApplicationRecord
  has_many :blogs
  validates_presence_of :title
  validates_uniqueness_of :title, case_sensitive: false

  extend FriendlyId
  friendly_id :title, use: :slugged

  class << self
    # Get all the topics which have published posts
    def with_published_posts
      includes(:blogs).where blogs: {status: 1}
    end
  end
end
