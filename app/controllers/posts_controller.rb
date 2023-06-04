class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    puts post_params
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to new_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end  

  private
  def post_params
    params.require(:post).permit(:title, :body, user_id: current_user.id)
  end
  
end
