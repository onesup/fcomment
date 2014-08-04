class Mypage::GamesController < ApplicationController
  def new
    @pages = current_user.pages
  end

  def edit
  end

  def index
  end
end
