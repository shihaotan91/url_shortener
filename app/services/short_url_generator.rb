# frozen_string_literal: true

class ShortUrlGenerator
  def initialize(message)
    @message = message
  end

  def generate
    Digest::SHA256.hexdigest(@message)[0..5]
  end
end
