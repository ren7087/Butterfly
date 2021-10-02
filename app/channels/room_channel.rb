class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_8"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    
    Message.create!(
      content: data['message'],
      user_id: current_user.id,
      room_id: data['room_id']
    )
  end
end
