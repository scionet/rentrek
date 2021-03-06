class ProfilesController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @all_my_equipment = Equipment.where(user: current_user)
    @my_reservations = Reservation.where(user: current_user)
  end
end
