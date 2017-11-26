class User::ReservationsController < ApplicationController

  def show
    @reservations = current_user.reservations.eager_load(:time_table).order("time_tables.select_date DESC")
  end

  def new
    @user = current_user

    @time_tables = TimeTable.where(status: true, select_date: Date.today..Date.today + 14.day)
    @esthe_menus = EstheMenu.all

    @reservation = Reservation.new
  end

  def create
    @user = current_user

    @esthe_menus = EstheMenu.all

    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      @reservation.time_table.update(status: false)
      redirect_to user_reservation_path, notice: '予約が完了しました。'
    else
      render :new
    end
  end

  def index
    @time_tables = TimeTable.all
    @start_day = Date.today + 1.day
    @end_day = Date.today + 14.day
  end

  private

    def reservation_params
      params.require(:reservation).permit(:esthe_menu_id, :comment, :time_table_id).merge(user_id: current_user.id)
    end

end
