class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :move_to_index]
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )
    if card.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    cards = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless cards.present?

    customer = Payjp::Customer.retrieve(@card.customer_token)
    card = customer.cards.retrieve(@card.customercard_token)
    card.delete

    customer.cards.create(
      card: params[:card_token]
    )

    if @card.update(customercard_token: params['car_token'])
      flash[:notice] = 'カード情報を更新しました'
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private

  def card_params
    params.permit(:card_token, :customer_token, :customercard_token).merge(user_id: current_user.id)
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def move_to_index
    if current_user.id != @card.user.id
      flash[:notice] = 'アクセス権限がありません'
      redirect_to root_path
    end
  end
end
