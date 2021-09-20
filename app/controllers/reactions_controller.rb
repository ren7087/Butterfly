class ReactionsController < ApplicationController
  def create
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    reaction.update(
      status: params[:reaction]
    )
  end
  
  
end
class ReactionsController < ApplicationController
  def create
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    reaction.update(
      status: params[:reaction]
    )
  end
  
  def reactions
    reactions = Reaction.where(from_user_id: current_user_id).where(status: 0)
    liked_users = Reaction.where(from_user_id: current_user_id).where(status: 0)
  end
end
