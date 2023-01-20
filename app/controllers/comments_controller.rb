# frozen_string_literal: true
class CommentsController < ApplicationController # rubocop:disable Style/Documentation
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find_by_id(params[:post_id])
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end
  # @comment = current_user.comments.create(comment_params)
  # redirect_to post_path(@comment.post)
  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    debugger
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
end