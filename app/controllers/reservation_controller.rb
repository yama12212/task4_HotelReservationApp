class ReservationController < ApplicationController
  def confirm
    @reserve = Reserve.new(reserve_params)
    @room = Room.find(@reserve.room_id)
    render template: "rooms/show" if @reserve.invalid?
  end

  def create
  end

  private

  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id)
  end
end
