class PostsController < ApplicationController
    before_action :authenticate_user!
    
    def new
      @post = Post.new
      @user = current_user
    end
    
    def create
      @user = current_user
      if @user.update(image: params[:image])
        redirect_to @user
        flash[:notice] = "投稿が保存されました"
      else
        redirect_to @user
        flash[:alert] = "投稿に失敗しました"
      end
    end

    private
      def post_params
      params.require(:post).permit(:image).merge(user_id: current_user.id)
      end
end

