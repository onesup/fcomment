class Mypage::CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.find params[:post_id]
    @page = @post.page
    @comments = @post.comments.includes(:player).order(id: :desc)
  end

  def edit
  end

  def new
  end
  
  def update_from_fb
    post = Post.find params[:post_id]
    post.fetch_comments
    redirect_to mypage_post_comments_path(post)
  end
  
end
