class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :faq, :search ]

  def home
  end

  def faq
  end

  def search
    @posts = Post.all
    if params[:query].present?
      @posts = @posts.global_search(params[:query])
    else
      @posts = []
    end
  end

  def profile
    @user = current_user
    @posts = @user.posts
    @total = @posts.all.count
  end

  def destroy_sesh
    sign_out_and_redirect(current_user)
  end
end
