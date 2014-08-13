class Mypage::GameStepsController < ApplicationController
  include Wicked::Wizard
  steps :post_select, :detail
  
  def show
    @game = current_game
    @pages = current_user.pages.order("likes desc")
    if @pages.count == 0
      redirect_to mypage_pages_path
    else
      render_wizard
    end
    
  end
  
  def new
    @game = current_game
  end

  def update
    @game = current_game
    @game.attributes = game_params
    render_wizard @game
  end
  
  def finish_wizard_path
    mypage_game_path(current_game)
  end
  
  private
  def game_params
    params.require(:game).permit(:page_id, :post_id)
  end
    # def redirect_to_finish_wizard
    #   redirect_to root_url, notice: "Thank you for signing up."
    # end
end
