class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ edit update destroy]
  before_action :search_product, only: [:index, :show, :search]
  
  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to new_user_session_path
    end

    if params[:q] != nil
      params[:q]['title_cont_any'] = params[:q]['title_cont_any'].split(/[\p{blank}\s]+/)
      @keyword =Post.ransack(params[:q])
      @posts = @keyword.result
    else
      @keyword = Post.ransack(params[:q])
      @posts = @keyword.result #検索の結果を受け取る。
    end


  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def new
      @post = Post.new
      @materials = @post.materials.build
      @procedures = @post.procedures.build

      @numbers = [1,2,3,4,5]
      @sum = 0
      @num = 0

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

  def recipe
    @meats = Post.where(recipe_category: 0)
    @fishs = Post.where(recipe_category: 1)
    @noodles = Post.where(recipe_category: 2)
    @vegetable_dishes = Post.where(recipe_category: 3)
    @rices = Post.where(recipe_category: 4)
    @pastas = Post.where(recipe_category: 5 )
    @washokus = Post.where(recipe_category: 6)
    @western_foods = Post.where(recipe_category: 7)
    @italians = Post.where(recipe_category: 8)
    @frances = Post.where(recipe_category: 9)
    @saladas = Post.where(recipe_category: 10)
    @sauces = Post.where(recipe_category: 11)
    @flours = Post.where(recipe_category: 12)
    @appetizers =  Post.where(recipe_category: 13)
    @time_savings = Post.where(recipe_category: 14)
    @anime_foods = Post.where(recipe_category: 15)
    @diets = Post.where(recipe_category: 16)
    @high_proteins = Post.where(recipe_category: 17)
    @snacks = Post.where(recipe_category: 18)
    @classics = Post.where(recipe_category: 19)
    @others = Post.where(recipe_category: 20)

    if params[:q] != nil
      params[:q]['title_cont_any'] = params[:q]['title_cont_any'].split(/[\p{blank}\s]+/)
      @keyword =Post.ransack(params[:q])
      @posts = @keyword.result
    else
      @keyword = Post.ransack(params[:q])
      @posts = @keyword.result #検索の結果を受け取る。
    end
  end

  def scope
    if params[:sort_meat]
      @posts = Post.where(recipe_category: 0) 
    elsif params[:sort_fish]
      @posts = Post.where(recipe_category: 1)
    elsif params[:sort_noodle]
      @posts = Post.where(recipe_category: 2)
    elsif params[:sort_vegetable_dish]
      @posts = Post.where(recipe_category: 3)
    elsif params[:sort_rice]
      @posts = Post.where(recipe_category: 4)
    elsif params[:sort_pasta]
      @posts = Post.where(recipe_category: 5 )
    elsif params[:sort_washoku]
      @posts = Post.where(recipe_category: 6)
    elsif params[:sort_western_food]
      @posts = Post.where(recipe_category: 7)
    elsif params[:sort_italian]
      @posts = Post.where(recipe_category: 8)
    elsif params[:sort_france]
      @posts = Post.where(recipe_category: 9)
    elsif params[:sort_salada]
      @posts = Post.where(recipe_category: 10)
    elsif params[:sort_sauce]
      @posts = Post.where(recipe_category: 11)
    elsif params[:sort_flour]
      @posts = Post.where(recipe_category: 12)
    elsif params[:sort_appetizer]
      @posts =  Post.where(recipe_category: 13)
    elsif params[:sort_time_saving]
      @posts = Post.where(recipe_category: 14)
    elsif params[:sort_anime_food]
      @posts = Post.where(recipe_category: 15)
    elsif params[:sort_diet]
      @posts = Post.where(recipe_category: 16)
    elsif params[:sort_high_protein]
      @posts = Post.where(recipe_category: 17)
    elsif params[:sort_snack]
      @posts = Post.where(recipe_category: 18)
    elsif params[:sort_classic]
      @posts = Post.where(recipe_category: 19)
    elsif params[:sort_other]
      @posts = Post.where(recipe_category: 20)
    else
      redirect_to posts_path, notice: "けんさくできませんでした"
    end

    # if params[:q] != nil
    #   params[:q]['title_cont_any'] = params[:q]['title_cont_any'].split(/[\p{blank}\s]+/)
    #   @keyword =Post.ransack(params[:q])
    #   @posts = @keyword.result
    # else
    #   @keyword = Post.ransack(params[:q])
    #   @posts = @keyword.result #検索の結果を受け取る。
    # end
  end

  def search
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title, 
        :tag, 
        :recipe_category, 
        :text, 
        :free_text, 
        :procedure, 
        :cooking_image, 
        :cooking_image_cache, 
        :procedure_image, :procedure_image_cache,  
        materials_attributes: [
          :id,
          :material, 
          :amount,
          :_destroy
          ],
        procedures_attributes: [
          :id,
          :procedure,
          :procedure_image,
          :_destroy
        ]
      )
    end

    def authenticate_user!
      if @post.user_id != current_user.id
        redirect_to posts_path, notice: "アクセスできません"
      end
    end

    
  def search_product
    @p = Post.ransack(params[:q])  
    @results = @p.result
  end
end
