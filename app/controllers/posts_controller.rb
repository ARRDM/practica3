class PostsController < ApplicationController
  before_action :es_el_usuario_post, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post =  Post.new(post_params)
    @post.m_user = m_user_actual
   if  @post.save
    redirect_to @post
   else
     render 'new'
   end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def index
    @post = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title,:blood_type_post,:location_post,:phone_post,:description)
  end

  def es_el_usuario_post
    @post = Post.find(params[:id])
    if (@post.m_user != m_user_actual)
      redirect_to m_user_actual
    end
  end

end
