# frozen_string_literal: true

class RedirectController < ApplicationController
  def show
    link = Link.find_by(short_url: params['short_url'])

    if link.present?
      redirect_to link.long_url
    else
      render404
    end
  end
end
