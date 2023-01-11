class CommentsController < ApplicationController
    def create
      @comment = current_user.comments.create(comment_params)
      redirect_to post_path(@comment.post)
    end
    def destroy
        @comment = current_user.comments.find_by(comment_params)
        @comment.destroy
        redirect_to post_path(@comment.post)
    end
    private
      def comment_params
        params.require(:comment).permit(:post_id, :body)
      end
  end
  