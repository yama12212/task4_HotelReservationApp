class SearchesController < ApplicationController

  def area
    @rooms = @area.result
    @count = @rooms.count
  end

  def keyword
    @keywords = Keyword.where("keyword like ?", "%#{params[:keyword]}%")
    @search = RoomsKeywordsSearch.where(keyword_id: @keywords)
    @search_room_id = @search.select("room_id")
    @rooms = Room.where(id: @search_room_id)
    @count = @rooms.count
  end
end
