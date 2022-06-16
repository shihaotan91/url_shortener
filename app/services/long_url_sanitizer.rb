class LongUrlSanitizer
  def initialize(long_url)
    @long_url = long_url
  end

  def sanitize
    remove_white_spaces
    add_leading_http
    add_trailing_default_domain

    @sanitized_url
  end

  def remove_white_spaces
    @sanitized_url = @long_url.downcase.gsub(/\s+/, '')
  end

  def add_leading_http
    @sanitized_url = "http://#{@sanitized_url}" unless @sanitized_url.match(/https?:\/\//)
  end

  def add_trailing_default_domain
    @sanitized_url = "#{@sanitized_url}.com" unless @sanitized_url.match(/\.[a-z]+$/)
  end
end
