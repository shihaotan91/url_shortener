class LongUrlSanitizer
  def initialize(long_url)
    @long_url = long_url
  end

  def sanitize
    return nil if @long_url.blank?

    remove_white_spaces
    add_leading_http

    @sanitized_url
  end

  def remove_white_spaces
    @sanitized_url = @long_url.downcase.gsub(' ', '')
  end

  def add_leading_http
    @sanitized_url = "http://#{@sanitized_url}" unless ['http://', 'https://'].any? { |s| @sanitized_url.start_with?(s) }
  end
end
