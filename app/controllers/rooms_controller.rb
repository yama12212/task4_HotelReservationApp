class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.where(user_id: current_user)
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @reserve = Reserve.new
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @keyword = RoomsKeywordsSearch.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    @image = params[:room][:image_name]
    
    if params[:room][:image_name]
      @room.image_name = @image.original_filename
    else
      @room.image_name = "sample_room.jpeg"
    end

    @keyword_params = Keyword.find_by(keyword: params[:room][:keyword])
    
    respond_to do |format|
      if @room.save
        #画像をpublicディレクトリに保存
        if params[:room][:image_name]
          File.binwrite("public/room_images/#{@room.image_name}",@image.read)
        end
        
        #キーワードを中間テーブルに保存
        unless @keyword_params == nil
          RoomsKeywordsSearch.new(room_id: @room.id, keyword_id: @keyword_params.id).save
        end

        format.html { redirect_to room_url(@room), notice: "ルーム登録を完了しました" }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "ルームが登録できませんでした" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :introduce, :single_rate, :address, :image_name, :user_id)
    end
end
