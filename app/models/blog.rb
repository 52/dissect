class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  belongs_to :topic

  validates_presence_of :title, :body

  extend FriendlyId
  friendly_id :title, use: :slugged
end
