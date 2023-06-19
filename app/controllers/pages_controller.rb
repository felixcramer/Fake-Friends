class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def post_join_room
    @room = Room.find_by(room_code: params[:user][:name])

    if @room == nil
      flash[:alert] = "No rooms available for that room code!"
      redirect_to join_room_path
    else
      if @room.room_users.length == 6
        flash[:alert] = "The room is full!"
        redirect_to join_room_path
      else
        @room_user = RoomUser.new
        @room_user.room = @room
        @room_user.user = current_user
        @room_user.counter = 10
        @room_user.save
        WaitingRoomChannel.broadcast_to(
          @room,
          render_to_string(
            partial: "waiting_rooms/waiting_room"
            # locals: { @room }
          )
        )
        redirect_to room_path(@room)
      end
    end
  end
end
