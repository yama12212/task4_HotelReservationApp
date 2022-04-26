class SearchesController < ApplicationController

  def area
    @rooms = @area.result
    @count = @rooms.count
  end

  def keyword
  end
end
