class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    puts post_params
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end  

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
  
end
