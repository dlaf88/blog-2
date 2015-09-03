class PostsController < ApplicationController
  before_filter :authenticate, :only => [:edit,:update,:admin]
  def index
    if params[:locale].present?
      @posts = Post.where(lang: params[:locale]).last(3).reverse
    else 
      redirect_to root_path
    end 
  end 
  def show
    @post = Post.friendly.find(params[:id])
    
  end
  def edit
    @post = Post.friendly.find(params[:id])
  end 
  def update
     @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end 
  end 
  def new
    @post = Post.new(:author => 'Diego Lafuente')
  end 
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, :notice => "Success"
    else 
      render 'new'
    end 
    
  end 
  def olderposts
     if params[:locale].present?
      @posts = Post.where(lang: params[:locale]).paginate(:page => params[:page], :per_page => 5)
    else 
      redirect_to root_path
    end 
  end
  def admin
    if params[:locale].present?
      @posts = Post.where(lang: params[:locale]).paginate(:page => params[:page], :per_page => 10)
    else 
      redirect_to root_path
    end     
  end 
  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to admin_path, alert: 'Post was successfully destroyed.'
    
  end 
  private
  def post_params
    params.require(:post).permit(:title,:description,:bootsy_image_gallery_id,:author,:post_image,:lang)
  end
  
  

 protected

def authenticate
  if Rails.env == 'production'
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
    end
  end 
end
  
  
end
