class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password].downcase)
      #成功時の処理
    else
      #失敗時の処理
      flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません"
      render "new"
    end
  end

  def destroy
  end
end
