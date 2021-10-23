class FavoritesController < ApplicationController

    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to post_path(params[:post_id]), notice: "レシピをお気に入りにしました"
    end

    def destroy
        favorite = current_user.favorites.create(id: params[:id]).destroy
        redirect_to post_path(params[:post_id]), notice: "レシピをお気に入り解除しました"
    end
end
