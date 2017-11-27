class User::ReservationsController < ApplicationController

  def show
    @reservations = current_user.reservations.eager_load(:time_table).order("time_tables.select_date DESC")
  end

  def new
    @user = current_user
    @reservation = Reservation.new
    session[:time_table_id] = params[:time_table_id]
    @time_table = TimeTable.find(session[:time_table_id])
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.time_table_id = session[:time_table_id]
    if @reservation.save
      @reservation.time_table.update(status: false)
      session[:time_table_id] = nil
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
