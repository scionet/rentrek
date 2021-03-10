class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy, :accept, :reject, :cancel]

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
        @reservation[:status] = "Pending"
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
            render :update
        end 
    end

    def destroy
        authorize @reservation
        @reservation.destroy
        redirect_to profile_path(current_user)
    end

    def accept
        responses("Accepted")
    end

    def reject
        responses("Rejected")
    end

    def cancel
        responses("Cancelled")
    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end

    def responses(action)
        authorize @reservation
        @reservation[:status] = action
        if @reservation.save
            redirect_to profile_path(current_user)
        else
            redirect_to reservation_path(@reservation)
        end
    end
end
