class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_user = current_user
  end

  def edit
    
  end

  def user_params
    params.require(:user).permit(:user_id)
  end
end
