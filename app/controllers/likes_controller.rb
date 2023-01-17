class LikesController < ApplicationController
    def create
        @post = Post.likes.find_by(params[:post_id])
        @like = @post.likes.find_by(user_id:current_user.id)
        unless @like.present?
            @post.likes.create(user_id:current_user.id)
            @post.count = @post.count + 1
            @post.save
        end
    else
        @like.destroy
        @post.count = @post.count-1
        @post.save
    end
    end
end