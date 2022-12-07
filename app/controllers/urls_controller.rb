class UrlsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  def index
    @urls = Url.all
  end

  def new
    @link = Url.new
    @clicked = Url.most_clicked
  end

  def create
    @user = current_user
    @link = @user.urls.build(url_params)
    @link.short_url = @link.generate_short_url
    if @link.save
      redirect_to urls_path
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_url_path
    end
  end

  def show
    @link = Url.click_count
    redirect_to @link.long_url
  end

  private

  def url_params
    params.require(:url).permit(:long_url, :user_id)
  end
end
