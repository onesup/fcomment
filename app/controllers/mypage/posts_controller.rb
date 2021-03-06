class Mypage::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @page = Page.find params[:page_id]
    @posts = @page.posts.order("id desc")
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def update_from_fb
    page = Page.find params[:page_id]
    page.fetch_posts
    redirect_to mypage_page_posts_path(page)
  end
end
