class ReservationController < ApplicationController
  def new
    @reserve = Reserve.new
  end

  def create
  end

  private

  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id)
  end
end
