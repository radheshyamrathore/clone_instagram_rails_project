class LikesController < ApplicationController
  def create
    @post = Post.find_by_id(params[:post_id])
    @like = @post.likes.create(likes_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(params[:id])
    @like.destroy
    redirect_to post_path(@post)
  end

  private  
  def likes_params
    params.require(:like).permit(:user)
  end
end
