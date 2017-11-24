class Staff::ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]

    def index
      @reservations = Reservation.all
    end

    def show
    end

    def new
      @reservation = Reservation.new
    end

    def edit
    end

    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        @reservation.time_table.update(status: false)
        redirect_to staff_reservation_path(@reservation), notice: '予約は正常に作成されました'
      else
        render :new
      end
    end

    def update
      if @reservation.update(reservation_params)
        redirect_to staff_reservation_path(@reservation), notice: '予約は正常に更新されました'
      else
        render :edit
      end
    end

    def destroy
      if @reservation.destroy
        @reservation.time_table.update(status: true)
        redirect_to staff_reservations_path, notice: '予約は正常に削除されました'
      end
    end

    private

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def reservation_params
        params.require(:reservation).permit(:user_id, :esthe_menu_id, :comment, :time_table_id)
      end

end
