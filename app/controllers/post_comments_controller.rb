class PostCommentsController < ApplicationController
  def create
    @post_comment = PostComment.new
    @post = Post.find(params[:post_id])
    @post_comment.user = current_user
    @post_comment.post = @post
  end

  def destroy
  end
end
