class UsersController < ApplicationController
  def index
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  private  #privateの下にあるアクションはusercontrollerないでしか呼び出せない  データがコントローラーないでしか呼び出せないのでセキュリティ良
  def user_params
    params.require(:user).permit(:username, :email, :profile, :image)
  end
end
