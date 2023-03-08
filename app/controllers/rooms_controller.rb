class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @user = current_user
    @room.user = @user
    @questions  = Question.all
    @questions.each do |question|
      question.room = @room
    end
    @room.room_code = 4.times.map{rand(10)}.join
    if @room.save
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
