class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy, :order, :order_destroy, :move_to_index]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:destroy,:new, :create, :sort, :sort_result]

  def new
    @book = Book.new
    @post = Post.find(params[:post_id])
    @books = @post.books.all
    @booksrev = @post.books.all.reverse
    @book_order = BookOrder.all
    @bookid = Book.find_by(id: params[:book_id])
    @book_orders = BookOrder.pluck(:book_id)
  end

  def create
    @post = Post.find(params[:post_id])
    @books = @post.books.all
    @book_order = BookOrder.all
    @book_orders = BookOrder.pluck(:book_id)
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = '予約を作成しました'
      redirect_to post_path(params[:post_id])
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = '予約を削除しました'
    redirect_to post_path(params[:post_id])
  end

  def order
    @book = Book.find(params[:id])
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token

    card = Payjp::Charge.create(
      amount: @book.price,
      customer: customer_token,
      currency: 'jpy'
    )
    billing_token = Payjp::Charge.retrieve(card.id).id
    if BookOrder.create(book_id: params[:id], user_id: current_user.id, billing_token: billing_token)
      flash[:notice] = '購入・予約が完了しました'
      redirect_to post_path(params[:post_id])
    end
  end

  def order_destroy
    @book = Book.find(params[:id])
    @book_order = BookOrder.find_by(book_id: @book.id)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.retrieve(@book_order.billing_token)
    charge.refund

    @book.destroy
    flash[:notice] = '予約を削除・返金しました'
    redirect_to post_path(params[:post_id])
  end

  def sort
    selection = params[:sortword]
    @books = Book.sort(selection)
    @post = Post.find(params[:post_id])
    @book = Kaminari.paginate_array(@post.books.all).page(params[:page]).per(4)
  end

  def sort_result
    @post = Post.find(params[:post_id])
    selection = params[:sortword]
    @book = if selection == 'new'
              Kaminari.paginate_array(@post.books.all.reverse).page(params[:page]).per(4)
            else
              Kaminari.paginate_array(@post.books.all).page(params[:page]).per(4)
            end
  end

  private

  def book_params
    params.require(:book).permit(:start_time, :end_time, :price, :memo, :capacity).merge(user_id: current_user.id,
                                                                                         post_id: params[:post_id])
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    @post = Post.find(params[:post_id])
    if current_user.id != @post.user_id
      flash[:notice] = 'アクセス権限がありません'
      redirect_to root_path
    end
  end
end
