class PostsController < ApplicationController
  before_filter :require_user, :except => [:index]
  def index
    @title = "Home"
    @posts = Post.paginate(:page=>params[:page], :per_page=>3, :order=>"created_at DESC")
  end
  
  def new
    @title = "Nueva Noticia"
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Noticia publicada satisfactoriamente."
      redirect_to posts_url
    else
      flash[:error] = "Ocurrio un error al publicar la noticia."
      @title = "Nueva Noticia"
      render 'new'
    end
  end
  
  def edit
    @title = "Editando Noticia"
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Noticia editada satisfactoriamente."
      redirect_to posts_url
    else
      flash[:error] = "Ocurrio un error al editar la noticia."
      @title = "Editando Noticia"
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Noticia eliminada satisfactoriamente."
    redirect_to posts_url
  end
end
