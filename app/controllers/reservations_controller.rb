class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]

    def show
        authorize @reservation
    end

    def new
        @equipment = Equipment.find(params[:equipment_id])
        @reservation = Reservation.new
        @reservation.equipment = @equipment
        authorize @reservation
    end

    def create
        @equipment = Equipment.find(params[:equipment_id])
        @reservation = Reservation.new(reservation_params)
        @reservation.user = current_user
        @reservation.equipment = @equipment
        @reservation[:status] = "pending"
        authorize @reservation
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end 
    end

    def edit
        authorize @reservation
    end

    def update
        authorize @reservation
        @reservation.update(reservation_params)
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end 
    end

    def destroy
        authorize @reservation
        @reservation.destroy
        redirect_to :root
    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end
end
