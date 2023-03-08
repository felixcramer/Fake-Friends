class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    @questions = Question.all
    @questions.each do |question|
      question.room = @room
      question.save
    end
    @room.room_code = 4.times.map{rand(10)}.join
    if @room.save
      @room_user = RoomUser.new
      @room_user.room = @room
      @room_user.user = current_user
      @room_user.save
      redirect_to room_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
