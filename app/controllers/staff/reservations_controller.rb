class Staff::ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]
    before_action :set_time_table, only: [:new, :edit, :create]

    def index
      @reservations = Reservation.page(params[:page]).per(25)
                                 .eager_load(:time_table).order("time_tables.select_date DESC")
    end

    def show
    end

    def new
      # @time_tables = TimeTable.where(status: true, select_date: Date.today..Date.today + 14.day).order("time_tables.select_date")
      @reservation = Reservation.new
      @time_tables = TimeTable.where(status: true, select_date: Date.today..Float::INFINITY).order("time_tables.select_date")
    end

    def edit
    end

    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        @reservation.time_table.update(status: false)
        redirect_to staff_reservation_path(@reservation), notice: '予約は正常に作成されました。'
      else
        render :new
      end
    end

    def update
      if @reservation.update(reservation_params)
        redirect_to staff_reservation_path(@reservation), notice: '予約は正常に更新されました。'
      else
        render :edit
      end
    end

    def destroy
      if @reservation.destroy
        @reservation.time_table.update(status: true)
        redirect_to staff_reservations_path, notice: '予約は正常に削除されました。'
      end
    end

    private

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def reservation_params
        params.require(:reservation).permit(:user_id, :esthe_menu_id, :comment, :time_table_id)
      end

      def set_time_table
        @time_tables = TimeTable.where(status: true, select_date: Date.today..Date.today + 14.day)
      end

end
