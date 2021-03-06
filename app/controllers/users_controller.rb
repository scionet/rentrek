class UsersController < ApplicationController
  # add show user_path
  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
