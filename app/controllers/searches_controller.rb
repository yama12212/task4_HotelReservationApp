class SearchesController < ApplicationController
  before_action :set_area, only: [:area]

  def area
    @rooms = @area.result
    @count = @rooms.count
  end

  def keyword
   
  end

  private

  def set_area
    @area = Room.ransack(params[:q])
  end

end
