class CommentsController < ApplicationController
  access site_admin: :all

  def create
    @blog = Blog.friendly.find params[:blog_id]
    @comment = @blog.comments.build comment_params
    @comment.user = current_user

    unless @comment.save
      flash[:danger] = "Comment #{@comment.errors.full_messages[0].downcase}"
    end

    redirect_to @blog
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end
end
