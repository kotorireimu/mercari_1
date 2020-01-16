# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def select
  end

  def new
    @user=  User.new
  end
  
  def address
    @user = User.new(address_params)
    @user.build_address
  end
  
  def phone
    @user = User.new(address_params)
  end

  def create
    @user = User.new(address_params)
    if @user.save 
      flash[:success] = '新しいユーザーを登録しました。'
      sign_in(@user)
      redirect_to user_card_index_path(@user)
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def card
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    @user = User.new
    @address = Address.new
    @card = Card.new
  end

  def confirm
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:family_name,:first_name,:family_name_kana,:first_name_kana,:birth_day,:tell)
  end
  
  def address_params
    params.require(:user).permit(:nickname,:email,:password,:family_name,:first_name,:family_name_kana,:first_name_kana,:birth_day,:tell,address_attributes:[:post_number,:prefecture,:city,:address_line,:building_name,:address_tell])
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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
  def after_sign_up_path_for(resource)
    new_card(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
