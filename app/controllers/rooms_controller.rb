class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    @room.room_code = 4.times.map{rand(10)}.join
    if @room.save
      @questions = Question.where(round: 1)
      @questions.each do |question|
        @room_question = RoomQuestion.new
        @room_question.question = question
        @room_question.room = @room
        @room_question.round = 1
        @room_question.save
      end
      @room_user = RoomUser.new
      @room_user.room = @room
      @room_user.user = current_user
      @room_user.counter = 10
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
