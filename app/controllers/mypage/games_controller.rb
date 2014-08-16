class Mypage::GamesController < ApplicationController
  before_action :authenticate_user!
  def new
    @game = Game.new
    @pages = current_user.pages.order("likes desc")
    if @pages.count == 0
      redirect_to mypage_pages_path
    end
  end
  
  def show
    @game = Game.find params[:id]
    @post = @game.post
  end

  def edit
  end

  def index
    @games = Game.where.not(post_id: nil).order("id desc")
  end
  
  def create
    @game = Game.new
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game}
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def toggle_status
    @game = Game.find params[:id]
    @game.toggle_status
  end
  
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def game_params
    params.require(:game).permit(:page_id, :post_id)
  end
  
end
