class UrlsController < ApplicationController
  before_action :authenticate_user!, only: [:click]
  def index
    @user = current_user
    @urls = Url.all.order(created_at: :desc)
  end

  def new
    @link = Url.new
  end

  def create
    @link = @user.urls.build(url_params)
    @link.short_url = @link.generate_short_url
    respond_to do |format|
      if @link.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend('urls', partial: 'urls/url', locals: { url: @link })
        end
        format.html { redirect_to post_url(@link), notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def clicks
    @link = Url.find_by_short_url(params['short_url'])
    @link.update(click: @link.click + 1)
    redirect_to @link.long_url, allow_other_host: true
  end

  def show
    @link = Url.click_count
    redirect_to @link.long_url
  end

  def most_clicked_link
    @user = current_user
    @clicked_most = @user.urls.most_clicked
  end

  private

  def url_params
    params.require(:url).permit(:long_url, :user_id)
  end
end
