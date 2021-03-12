class ProfilesController < ApplicationController
  def my
    @user = current_user
    authorize @user
    @all_my_equipment = Equipment.where(user: @user).order(created_at: :desc)
    @my_reservations = Reservation.where(user: @user).order(created_at: :desc)
    @incoming_reservations = Reservation.where.not(user: @user).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @their_equipment = Equipment.where(user: @user)
  end
end
