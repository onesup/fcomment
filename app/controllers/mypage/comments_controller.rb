class Mypage::CommentsController < ApplicationController
  def index
    @post = Post.find params[:post_id]
    @post_data = MessagePack.unpack @post.raw_data
  end

  def edit
  end

  def new
  end
  
  def update_from_fb
    post = Post.find params[:post_id]
    # post.update_comments_to_raw_data
    redirect_to mypage_post_comments_path(post)
  end
  
end
