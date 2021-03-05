class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show]
    after_action :save_show_reservation, only: [:create]
    
    def index
        @reservations = Reservation.all
    end

    def show
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @equipment = Equipment.find(params[:equipment_id])
        @reservation = Reservation.new(reservation_params)
        @reservation.user = current_user
        @reservation.equipment = @equipment
    end

    private

    def reservation_params
        params.require(:reservation).permit[:start_date, :end_date, :status]
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end
end
