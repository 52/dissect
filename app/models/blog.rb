class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body, :topic_id

  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope ->{order created_at: :desc}
end
