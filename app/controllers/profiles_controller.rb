class ProfilesController < ApplicationController
  def my
    @user = current_user
    authorize @user
    @all_my_equipment = Equipment.where(user: @user)
    @my_reservations = Reservation.where(user: @user)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @their_equipment = Equipment.where(user: @user)
  end
end
