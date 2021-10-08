class FavoritesController < ApplicationController

    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to posts_path, notice: "#{favorite.post.user.name}さんのレシピをお気に入りにしました"
    end

    def destroy
        favorite = current_user.favorites.create(post_id: params[:post_id]).destroy
        redirect_to posts_path, notice: "#{favorite.post.user.name}さんのレシピをお気に入りを解除しました"
    end
end
