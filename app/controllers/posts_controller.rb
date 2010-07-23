class PostsController < ApplicationController
  before_filter :require_user, :except => [:index]
  def index
    @title = "Home"
    @posts = Post.paginate(:page=>params[:page], :per_page=>2, :order=>"created_at DESC")
  end
  
  def new
    @title = "Nueva Noticia"
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to posts_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @title = "Editando Noticia"
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to posts_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end
