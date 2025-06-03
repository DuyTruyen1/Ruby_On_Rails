class CategoriesController < ApplicationController
  #tat ca cate
  def index
    @categories = Category.all
  end

  #show chi tiet
  def show
    @category = Category.find(params[:id])
  end



  def new
    @category = Category.new
  end

  #them moi
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  #cap nhat
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  #xoa
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private

  #dau vao
  def category_params
    params.require(:category).permit(:name, :description)
  end
end