# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :reject_inactive_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected



  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_active
        redirect_to root_path
      end
    end
  end
end

  # def reject_inactive_customer
  #   @customer = Customer.find_by(email: params[:customer][:email])
  #   if @customer
  #     if @customer.valid_password?(params[:customer][:password]) && !@customer.is_active
  #       flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
  #       redirect_to new_customer_session_path
  #     end
  #   end
  # end