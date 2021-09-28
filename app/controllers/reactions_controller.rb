class ReactionsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    reaction.update(
      status: params[:reaction]
    )
    # ここでマッチしたらRommUserとRoomを新規作成するメソッドを追加する。
    if Reaction.where(to_user_id: current_user.id, from_user_id: params[:user_id], status: 'like')
      room = Room.create
      RoomUser.create(user_id: current_user.id, room_id: room.id)
      RoomUser.create(user_id: params[:user_id], room_id: room.id)
    end
  end
end
