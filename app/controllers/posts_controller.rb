class PostsController < ApplicationController
    def index
      @posts = Post.all
    end
  
    # show chi tiet cua 1 post
    def show
      @post = Post.find(params[:id])
    end
  

    def new
      @post = Post.new
      @categories = Category.all
    end
  
    # hamf tao moi 
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        @categories = Category.all
        render :new
      end
    end
  
    # chinh sua theo id , khi click vao chinh thi se lay id ng dung hien thi len form do
    def edit
      @post = Post.find(params[:id])
      @categories = Category.all
    end
  
    # ham xu ly cap nhat 
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        @categories = Category.all
        render :edit
      end
    end
  
    # Xóa post
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully deleted.'
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end
    
  end