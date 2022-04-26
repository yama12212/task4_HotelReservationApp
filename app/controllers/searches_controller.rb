class SearchesController < ApplicationController
  def area
    @q = Room.ransack(params[:q])
    @rooms = @q.result
    @count = @rooms.count
  end

  def keyword
  end
end
