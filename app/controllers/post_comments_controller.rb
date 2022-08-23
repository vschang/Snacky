class PostCommentsController < ApplicationController

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post = Post.find(params[:post_id])
    @post_comment.user = current_user
    @post_comment.post = @post
    if @post_comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post = Post.find(params[:post_id])
    @post_comment.destroy
    redirect_to post_path(@post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :user_id, :post_id, :id)
  end
end
