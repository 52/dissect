class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates_presence_of :content, :user_id, :blog_id

  after_create_commit ->{CommentBroadcastJob.perform_later(self)}
end
