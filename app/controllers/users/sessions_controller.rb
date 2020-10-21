# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  #   # session[:email] = user.email
  #   user = User.find_by(email: params[:session][:email].downcase)   # メールアドレスでユーザーを検索

  #   if user && user.authenticate(params[:session][:password])   # パスワードの一致を検証
  #     # session[:user_id] = user.id
  #     # session[:id] = user.id     # user.sign_in
  #     log_in user
  #     redirect_to "/mypage/index"    #'ログイン成功'
  #   else
  #     render :new
  #   end
  #   # user = User.find_by!(email: params[:email]) # 入力されたメールアドレスからユーザーを検索
  #   # if user.authenticatable_salt(params[:password])   # パスワードを検証
  #   #   session[:user_email] = user.email         # 検証OKなら、セッションにメールアドレスを保存
  #   #   redirect_to "/mypage/index"             # マイページへ遷移
  #   # else
  #   #   render 'new'                            # パスワード検証NGなら、ログイン画面を再表示
  #   # end
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
end
