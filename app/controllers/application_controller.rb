# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def render404
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
