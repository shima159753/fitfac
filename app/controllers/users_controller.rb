class UsersController < ApplicationController
  # before_action :set_user, only: [:show]
  def show
    @nickname = current_user.nickname
    @email = current_user.email
    @user = current_user
    @cards = current_user.card
    @posts = @user.posts
    @books = Book.all
    @users = User.find(params[:id])
    @book_orders = BookOrder.all
    @gooduser = User.find_by(id: params[:id])
    @good = Good.where(user_id: @gooduser.id)
    @book_orderpluck = BookOrder.pluck(:book_id)

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  # private

  # def move_to_index
  # if current_user != @posts.user || @item.order != nil
  # redirect_to action: :index
  # end
  # end

  # def user_params
  # params.require(:user).permit(:nickname,:email,:encrypted_password)
  # end

  # def set_user
  # @user = User.find(params[:id])
  # end
end
