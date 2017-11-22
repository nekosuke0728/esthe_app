class User::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation), notice: '予約は正常に作成されました'
    else
      render :new
    end
  end

end
