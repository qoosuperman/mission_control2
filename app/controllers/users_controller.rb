class UsersController < ApplicationController
  before_action :check_admin, only: [:index, :edit, :update, :destroy]
  before_action :find_user, only: [:edit, :update, :show, :destroy, :mission]

  def index
    # 晚點需要用分頁處理
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.skip_password_validation = true
    if @user.update(user_params)
      redirect_to admin_path, notice: t("notice.update_success")
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @user.destroy
      redirect_to admin_path, notice: t("notice.delete_success")
    else
      redirect_to admin_path, notice: t("notice.delete_fail")
    end
  end

  def mission
    @missions = @user.missions
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def check_admin
    (redirect_to root_path, notice: t("user.role_must_be_admin")) unless current_user.role == "admin"
  end
end
