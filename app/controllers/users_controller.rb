class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.where.not(id: current_user.id)
    @user = User.find(current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def reactions
    @user = User.where(id: liked_users.pluck(:to_user_id))
    reactions = Reaction.where(from_user_id: current_user_id).where(status: 0)
    liked_users = Reaction.where(from_user_id: current_user_id).where(status: 0)
  end
  
end
