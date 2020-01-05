class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toogle_status]
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toogle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :toogle_status, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @blogs = Blog.page(params[:page]).per(3).order(created_at: :desc)
    @page_title = "My Portfolio Blog"
  end
  

  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new

      @page_title = @blog.title
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: "You are not authorized to view this page"
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
    end
  end

  def toogle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end
end
