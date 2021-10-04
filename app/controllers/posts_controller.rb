class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ edit update destroy]

  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
      @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    elsif @post.save
      redirect_to posts_path, notice: "レシピを追加しました"
    else
      render :new
    end
  end  

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "編集しました"
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :material, :amount, :tag, :text, :free_text, :procedure, :cooking_image, :image_cache, :procedure_image, :image_cache)
    end

    def authenticate_user!
      if @post.user_id != current_user.id
        redirect_to posts_path, notice: "アクセスできません"
      end
    end
end
