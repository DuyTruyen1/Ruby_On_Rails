class MicropostsController < ApplicationController
  before_action :set_micropost, only: [ :show, :edit, :update, :destroy ]

  def index
    @microposts = Micropost.all
  end

  def show
  end

  def new
    @micropost = Micropost.new
  end

  def edit
  end

  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      redirect_to @micropost, notice: "Tao bai viet thanh cong."
    else
      flash.now[:error] = "Khong the tao bai viet."
      render :new
    end
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: "Cap nhat bai viet thanh cong."
    else
      flash.now[:error] = "Khong the cap nhat bai viet."
      render :edit
    end
  end

  def destroy
    @micropost.destroy
    redirect_to microposts_url, notice: "Da xoa bai viet thanh cong."
  end

  private

  def set_micropost
    @micropost = Micropost.find_by(id: params[:id])
    redirect_to microposts_path, alert: "Khong tim thay bai viet nay." unless @micropost
  end

  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
