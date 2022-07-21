class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
    if params[:query].present?
      @posts = @posts.global_search(params[:query])
    else
      @message = "No results found for #{params[:query]}"
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
