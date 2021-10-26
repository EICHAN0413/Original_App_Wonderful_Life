class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :ensure_normal_user, only: %i[ show ]




  def show
  end
  


  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_normal_user
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      redirect_to posts_path, alert: 'このページは閲覧できません。'
    end
  end

end
