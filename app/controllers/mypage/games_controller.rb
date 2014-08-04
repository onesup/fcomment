class Mypage::GamesController < ApplicationController
  before_action :authenticate_user!
  def new
    @pages = current_user.pages
  end

  def edit
  end

  def index
  end
end
