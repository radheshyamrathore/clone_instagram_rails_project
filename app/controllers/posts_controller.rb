class PostsController < ApplicationController  
  def index
    @posts=Post.all
    if session[:user_id]
      @user = User.find_by(id:session[:user_id])
    end
    # @post = current_user.posts.find_by(post_params)
    # # @post = Post.find_by(params[:post_id])
    # # @user = User.find(@post.user_id)
  end

  def show
    @post = Post.find(params[:id])
    # @post = Post.find(params[:id])
    # @user = User.find(params[:user_id])
    # @post = @user.posts.find(params[:id])
  end

  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @post=Post.new
    #@user_id = params[:user_id]
  end

  def create
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   end
  #   @post = @user.posts.create(post_params)
  #   if @post.save
  #     redirect_to @post
  #   else
  #     render :new #status: :unprocessable_entity
  #   end
  # end
  #@user = current_user.id
    # @post = @user.posts.create(post_params) 
  @user=User.find(params[:user_id])
  @post=Post.create(post_params)
  @post.user_id = @user.id
    if @post.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    #@post = current_user.posts.find_by(post_params)
    # @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to @post
    #redirect_to root_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:body, :post_type)
    end
end