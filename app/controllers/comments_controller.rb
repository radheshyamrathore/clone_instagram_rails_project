class CommentsController < ApplicationController

  def new 
    @comment = Comment.new 
  end 

  def create
    @post = Post.find_by_id(params[:post_id])
    #@post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
    end 
    # @comment = current_user.comments.create(comment_params)
    # redirect_to post_path(@comment.post)

  def destroy
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.find(params[:id])
    # @comment.destroy
    # redirect_to post_path(@post), status: :see_other
    @comment = current_user.comments.find_by(comments_params)
    @comment.destroy
    redirect_to post_path(@comment.post)
  end
  private
  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
end