class RankingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "general"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
