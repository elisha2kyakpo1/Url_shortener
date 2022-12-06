class UrlsController < ApplicationController
  # def index; end

  # def new
  #   @link = Url.new
  # end

  # def create
  #   link = Url.new(link_params)
  #   return redirect_to link if link.save

  #   redirect_to new_link_url, flash: { error: link.errors.messages[:long_url] }
  # end

  # def show
  #   @link = Url.find_by_short_url(params[:short_url])
  #   render 'errors/404', status: 404 if @link.nil?
  #   @link.update_attribute(:clicked, @link.clicked + 1)
  #   redirect_to @link.long_url
  # end

  # private

  # def link_params
  #   params.require(:url).permit(:long_url)
  # end

  def index
    @urls = Url.all
  end

  def new
    @link = Url.new
  end

  def create
    @user = current_user
    @link = @user.urls.build(url_params)
    @link.short_url = @link.generate_short_url
    @link.long_url = @link.sanitize
    if @link.save
      redirect_to urls_path
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_url_path
    end
  end

  def show
    @link = Url.find_by(short_url: params[:short_url])
    redirect_to @link.sanitize
  end

  private

  def url_params
    params.require(:url).permit(:long_url, :user_id)
  end
end
