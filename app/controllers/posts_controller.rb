class PostsController < ApplicationController
  def index
    @posts=Post.all
    @post = Post.find_by(params[:post_id])
    @user = User.find(@post.user_id)
  end

  def show
    #@post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post=Post.new
    @user_id = params[:user_id]
  end

  def create
    @user=User.find(params[:user_id])
    @post=Post.new(post_params)
    @post.user_id = @user.id
    if @post.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to root_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:body, :post_type)
    end
end
