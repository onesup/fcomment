class Mypage::GamesController < ApplicationController
  before_action :authenticate_user!
  def new
    @game = Game.new
    @pages = current_user.pages.order("likes desc")
    if @pages.count == 0
      redirect_to mypage_pages_path
    end
  end

  def edit
  end

  def index
  end
end
