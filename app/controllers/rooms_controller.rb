class RoomsController < ApplicationController
   before_action :authenticate_user!
   
  
  # def create
  #   current_user_rooms = RoomUser.where(user_id: current_user.id).map(&:room)
  #   room = RoomUser.where(room: current_user_rooms, user_id: params[:user_id]).map(&:room).first
  #   if room.blank?
  #     room = Room.create
  #     RoomUser.create(room: room, user_id: current_user.id)
  #     RoomUser.create(room: room, user_id: params[:user_id])
  #   end
  #   redirect_to action: :show, id: room.id
  # end

  def show
    # ここでRoom_idを検索する。でも複数のroom_idが出てきてしまうので、ログインしてるユーザーとマッチした相手のroom_idだけを抽出する。
    @room_user_ids = RoomUser.where(user_id: params[:user_id]).pluck(:room_id)
    @me_room_user_ids = RoomUser.where(user_id: current_user.id).pluck(:room_id)
    # @room_userと@me_room_userのかぶってるroom_idが対象のroom_idとなる。
    @room_user = RoomUser.where(room_id: @room_user_ids & @me_room_user_ids)
    @room = Room.find(params[:id])
    #@room_user = @room.room_users.where.not(user_id: current_user.id).first.user
    @messages = Message.where(room: @room)
  end
end
