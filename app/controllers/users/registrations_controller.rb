# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    #   super
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @card = @user.build_card
    render :new_card
    #   super
  end

  def create_card
    @user = User.new(session['devise.regist_data']['user'])

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )

    @card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      customercard_token: customer.default_card
    )

    @user.build_card(@card.attributes)
    if @user.save
      session['devise.regist_data']['user'].clear
      NotificationMailer.send_confirm_to_user(@user).deliver
      sign_in(:user, @user)
    else
      render :new_card
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def card_params
    params.require(:address).permit(:postal_code, :address)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
