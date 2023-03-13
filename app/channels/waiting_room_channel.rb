class WaitingRoomChannel < ApplicationCable::Channel
  def subscribed
    waiting_room = Room.find(params[:id])
    stream_for waiting_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
