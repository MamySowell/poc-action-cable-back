class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def created(data)
    ActionCable.server.broadcast "conversations_#{data["room"]}", "room : #{data["room"]} => message #{data["message"]}"
  end
end
