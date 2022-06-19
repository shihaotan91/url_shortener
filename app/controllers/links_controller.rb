# frozen_string_literal: true

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
      flash.now[:error] = @link.errors.messages[:long_url].to_sentence
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @short_url = "#{request.base_url}/#{@link.short_url}"
  rescue ActiveRecord::RecordNotFound
    render404
  end

  private

  def permitted_params
    params.require(:link).permit(:long_url)
  end
end
