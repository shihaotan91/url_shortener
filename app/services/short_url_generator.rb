class ShortUrlGenerator
  def initialize(message)
    @message = message
  end

  def generate
    short_code = Digest::SHA256.hexdigest(@message)[0..5]
    "#{ENV["ROOT_URL"]}/#{short_code}"
  end
end
