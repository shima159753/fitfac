class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy, :likes, :move_to_index,:map]
  before_action :authenticate_user!, except: [:index, :show, :search, :sort]
  before_action :move_to_index, except: [:index, :show, :search, :sort,:new,:create]

  def index
    @post = Post.find_by(params[:id])
    @posts = Post.all.order('start_time DESC')
    @goods_count = Good.where(post_id: @post).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '店舗登録に成功しました'
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @books = @post.books.all.order('created_at DESC')
    @book = Book.find_by(params[:book_id])
    @book_order = BookOrder.all
    @book_orders = BookOrder.pluck(:book_id)
    @goods_count = Good.where(post_id: @post.id).count
  end

  def edit
  end

  def update
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = @post.images.find(image_id)
        image.purge
      end
    end

    if @post.update(post_params)
      flash[:notice] = '店舗情報を更新しました'
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @post.user.id
      @post.destroy
      flash[:notice] = '店舗情報を削除しました'
      redirect_to root_path
    end
  end

  def search
    @posts = Kaminari.paginate_array(Post.search(params[:keyword]).reverse).page(params[:page]).per(4)
    session["search"] = params[:keyword]
    selection = params[:sortword]
  end

  def sort
    selection = params[:sortword]
    if selection == 'new'
      @posts = Kaminari.paginate_array(Post.search(session["search"]).reverse).page(params[:page]).per(4)
    elsif selection == 'likes'
      @posts = Kaminari.paginate_array(Post.find(Good.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))& (Post.search(session["search"]))).page(params[:page]).per(4)
    else
      @posts =  Kaminari.paginate_array(Post.search(session["search"])).page(params[:page]).per(4)
    end
   # @posts = Kaminari.paginate_array(Post.sort(selection)).page(params[:page]).per(2)
   #@post = Kaminari.paginate_array(Post.search(params[:keyword])).page(params[:page]).per(2)
  end


  private

  #def map_address
   # params(:prefecture,:city,:address,:building_name)
  #end

  def post_params
    params.require(:post).permit(:image, :name, :postal_code, :prefecture, :city, :address, :building_name, :price, :bus_hours, :text,
                                 :item, :caution, :youtube_id, images: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    if current_user.id != @post.user_id
      flash[:notice] = 'アクセス権限がありません'
      redirect_to action: :index
    end
  end
end
