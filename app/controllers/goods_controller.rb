class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    
    @good = Good.new(
      user_id: current_user.id,
      post_id: params[:post_id]
    )

    @good.save
    @goods_count = Good.where(post_id: @post.id).count

    #redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @post = Post.find(params[:post_id])
    
    @good = Good.find_by(user_id: current_user.id,
                         post_id: params[:post_id])
    @good.destroy
    @goods_count = Good.where(post_id: @post.id).count
    #redirect_to("/posts/#{params[:post_id]}")
  end
end
