class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]


  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
  end

  def new
    if params[:back]
    @feed = Feed.new(feed_params)
    else
    @feed = Feed.new
    end
  end

  def edit
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    render :new if @feed.invalid?
  end

  def create
    @feed = current_user.feeds.build(feed_params)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: '投稿されました' }
        format.json { render :show, status: :created, location: @feed }
        FeedMailer.feed_mail(@feed).deliver
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: '更新されました' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @feed.destroy
      respond_to do |format|
        format.html { redirect_to feeds_url, notice: '削除されました' }
        format.json { head :no_content }
      end
  end

  #####################################################################
    private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:image, :message, :image_cache)
    end

    def check_user
        @feed = Feed.find(params[:id])
        unless current_user.id == @feed.user_id
        flash[:notice] = "編集権限がありません"
        redirect_to feeds_path
      end
    end
end
