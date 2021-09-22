class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.where.not(id: current_user.id)
    @user = User.find(current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def likes
    @user = User.find(params[:id])
    @liked_users = Reaction.where(from_user_id: current_user_id).where(status: 0)
    User.where(id: liked_users.pluck(:to_user_id))
  end
  
end
