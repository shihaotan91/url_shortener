class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(permitted_params)
    if @link.valid?
      @link.save!
      redirect_to link_path(@link.id)
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @short_url = "#{ENV['ROOT_URL']}/#{@link.short_url}"
  end

  def redirect
    short_url = request.env['REQUEST_PATH'].last(-1)
    link = Link.find_by(short_url: short_url)

    if link.present?
      redirect_to link.long_url
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  private

  def permitted_params
    params.require(:link).permit(:long_url)
  end
end
