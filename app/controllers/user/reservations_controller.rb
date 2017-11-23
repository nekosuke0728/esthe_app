class User::ReservationsController < ApplicationController

  def show
    @reservations = current_user.reservations
  end

  def new
    @user = current_user
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to user_reservation_path, notice: '予約が完了しました'
    else
      render :new
    end
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:esthe_menu_id, :comment, :start_at).merge(user_id: current_user.id)
    end

end
