class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show]
    
    def index
        @reservations = policy_scope(Reservation).order(created_at: :desc)
    end

    def show
        authorize @reservation
    end

    def new
        @reservation = Reservation.new
        authorize @reservation
    end

    def create
        @equipment = Equipment.find(params[:equipment_id])
        @reservation = Reservation.new(reservation_params)
        authorize @reservation
        @reservation.user = current_user
        @reservation.equipment = @equipment
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end 
    end

    private

    def reservation_params
        params.require(:reservation).permit[:start_date, :end_date, :status]
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end
end
