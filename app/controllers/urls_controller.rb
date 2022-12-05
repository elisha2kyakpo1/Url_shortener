class UrlsController < ApplicationController
  def index; end

  def new
    @link = Link.new
  end

  def create
    link = Url.new(link_params)
    return redirect_to link if link.save

    redirect_to new_link_url, flash: { error: link.errors.messages[:long_url] }
  end

  def show
    @link = Url.find_by_short_url(params[:short_url])
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to @link.long_url
  end

  private

  def link_params
    params.require(:url).permit(:long_url)
  end
end