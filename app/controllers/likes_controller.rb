class LikesController < ApplicationController
  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )

    @like.save

    redirect_to post_path(@post.id)
  end
end
