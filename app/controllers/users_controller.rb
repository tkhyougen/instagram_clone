class UsersController < ApplicationController
  before_action :check_user, only: [:update]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render "show"
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def favorite_index
    @favorites = current_user.favorite_feeds
  end

  def index
    @user = User.find(params[:id])
  end

 ################################
    private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:image)
    end

    # def user_update_params
    #   params.require(:user).permit(:name, :email, :image, :image_cache)
    # end

    def check_user
      @user = User.find(params[:id])
      unless current_user.id == @user.id
        flash[:notice] = "編集権限がありません"
        redirect_to blogs_path
      end
    end

end
