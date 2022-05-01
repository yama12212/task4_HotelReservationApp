class ReservationController < ApplicationController
  def confirm
    @reserve = Reserve.new(reserve_params)
    @room = Room.find(@reserve.room_id)
    render template: "rooms/show" if @reserve.invalid?
  end

  def create
    @reserve = Reserve.new(reserve_params)

    if @reserve.save
      flash[:notice] = "予約が確定しました"
      redirect_to reservation_show_url
    else
      flash[:notice] = "エラーが発生しました。もう一度予約をやり直してください"
      redirect_to "/rooms/#{@reserve.room_id}"
    end
  end

  def show
  end

  private

  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id, :total_rate)
  end
end
