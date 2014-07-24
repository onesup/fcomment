class Mypage::PostsController < ApplicationController
  def index
    @page = Page.find params[:page_id]
    @posts = @page.posts
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def update_from_fb
    page = Page.find params[:page_id]
    page.update_posts_to_raw_data
    redirect_to mypage_page_posts_path(page)
  end
end
