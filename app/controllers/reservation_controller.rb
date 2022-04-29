class ReservationController < ApplicationController
  def new
    @reserve = Reserve.new
  end
end
