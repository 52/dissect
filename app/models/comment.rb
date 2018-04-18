class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  default_scope ->{order created_at: :desc}

  validates_presence_of :content, :user_id, :blog_id
end
