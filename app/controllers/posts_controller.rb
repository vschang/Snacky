class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @all_posts = Post.all
    @posts = @all_posts.sort_by {|posts| posts.created_at}.reverse

    if params[:query].present?
      @posts = @all_posts.global_search(params[:query])
    else
      @message = "No results found for #{params[:query]}"
    end

    @selected = params[:order]

    @likes_of_posts_with_i = @posts.each_with_index.map {|post, index| [post.post_likes.count, index]}
    @likes_of_posts_with_i.sort_by! {|likes, index| likes}.reverse
    @index_of_likes_of_posts_with_i = @likes_of_posts_with_i.map {|likes, index| index}
    @posts_with_i = @index_of_likes_of_posts_with_i.map {|index| @posts[index]}


    case params[:order]
    when "newest"
      @posts = Post.all.order(:created_at => :desc)
    when "oldest"
      @posts = Post.all.order(:created_at => :asc)
    when "highest"
      @posts = Post.all.order(:rating => :desc)
    when "lowest"
      @posts = Post.all.order(:rating => :asc)
    when "popular"
      @posts = @posts_with_i.reverse
    end

  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @post_likes = PostLike.new
    @liked_post = PostLike.find_by(post_id: @post.id, user_id: @user.id)

    # lambda liked_by(user)
    #   @post.post_likes.map {|post_like| post_like.user.username}
    # end
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = @user.id

    if @post.save
      redirect_to post_path(@post), notice: "posted successfully 🎉"
    else
      render :new, alert: "post failed 💔"
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

  private

  def post_params
    params.require(:post).permit(:title, :review, :rating, :image, :country, :brand, :user_id, :order)
  end
end
