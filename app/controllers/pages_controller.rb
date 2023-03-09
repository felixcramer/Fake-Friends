class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :informations]

  def home
  end

  def informations
  end

  def enter_room
  end

  def post_form
    @room = Room.find_by(room_code: params[:user][:name])

    if @room == nil
      flash[:alert] = "No rooms available for that room code!"
      redirect_to enter_room_path
    else
      # if @room.room_users.length == 8
      #   flash[:alert] = "The room is full!"
      #   redirect_to enter_room_path
      # else
      #   accept user -see down
      # end
      @room_user = RoomUser.new
      @room_user.room = @room
      @room_user.user = current_user
      @room_user.save
      redirect_to room_path(@room)
    end
  end
end
