class UsersController < ApplicationController
  # add show user_path
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def profile
    @user = current_user
    authorize @user
    @all_my_equipment = Equipment.where(user: current_user)
    @my_reservations = Reservation.where(user: current_user)
  end
end
