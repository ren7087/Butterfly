class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @checked_user_ids = Reaction.where(from_user_id: current_user.id).pluck(:to_user_id)
    users = User.where.not(id: current_user.id)
    @users = users.where.not(id: @checked_user_ids)
    @user = User.find(current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def likes
    @user = User.find(params[:id])
    @liked_users = Reaction.where(from_user_id: current_user.id).where(status: 0)
    @users = User.where(id: @liked_users.pluck(:to_user_id))
  end
  
  def liked
    @user = User.find(params[:id])
    @likes_users = Reaction.where(to_user_id: current_user.id).where(status: 0)
    @users = User.where(id: @likes_users.pluck(:from_user_id))
  end
  
  
end
