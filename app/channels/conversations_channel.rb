class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def created(data)
    ActionCable.server.broadcast 'conversations_channel', data["message"]
  end
end
