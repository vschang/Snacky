class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
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
