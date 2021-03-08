class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @good = Good.new(
      user_id: current_user.id,
      post_id: params[:post_id]
    )

    @good.save

    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id,
                         post_id: params[:post_id])
    @good.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
