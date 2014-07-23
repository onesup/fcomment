class Mypage::PagesController < ApplicationController
  def index
    @user = current_user
    @pages = @user.pages.order("likes desc")
  end

  def show
  end

  def edit
  end

  def update
  end
  
  def update_from_fb
    current_user.update_pages
    redirect_to mypage_pages_path
  end
end
