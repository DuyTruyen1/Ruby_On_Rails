class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Tao nguoi dung thanh cong.'
    else
      flash.now[:error] = 'Khong the tao nguoi dung.'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Cap nhat thong tin thanh cong.'
    else
      flash.now[:error] = 'Khong the cap nhat thong tin.'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Xoa nguoi dung thanh cong.'
  end


  private
    def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to users_path, alert: 'Khong tim thay nguoi dung.'
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end