class PostsController < ApplicationController
  def index
    @posts = Post.all
    if params[:query].present?
      @posts = @posts.global_search(params[:query])
    else
      @message = "No results found for #{params[:query]}"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = @user.id

    if @post.save
      redirect_to post_path(@post), notice: "posted successfully!"
    else
      render :new, alert: "post failed"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :review, :rating, :image, :country, :brand, :user_id)
  end
end
