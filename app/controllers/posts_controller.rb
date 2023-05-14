class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  
    def index
      @posts = Post.all
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end
  
    def edit
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  
    def update
      if @post.update(post_params)
        redirect_to posts_path
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private
  
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title,	:hotel,	:room,	:check_in,	:check_out,	:text, :place_id, :image).merge(user_id: current_user.id)
    end

    def move_to_index
      return if current_user.id == @post.user_id
      redirect_to action: :index
    end
  
end
