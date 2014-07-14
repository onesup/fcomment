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
    @user = current_user
    Page.update_pages(@user)
    redirect_to mypage_pages_path
  end
end
