# frozen_string_literal: true

class PostsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :logged_in_user
  def index
    @posts = Post.all
    return unless session[:user_id]
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id]) if session[:user_id]
    # @user=User.find(params[:user_id])
    @post = Post.create(post_params)
    @post.user_id = @user.id
    @post.author_user = @user.name
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(session[:user_id]) if session[:user_id]
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    # redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:body, :post_type, :image, :video)
  end
end
