class RankingChannel < ApplicationCable::Channel
  def subscribed
    rankingroom = Room.find(params[:id])
    stream_for rankingroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
