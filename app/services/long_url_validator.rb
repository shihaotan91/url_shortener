class LongUrlValidator
  def initialize(long_url)
    @long_url = long_url
  end

  def valid?
    return false if @long_url.blank?

    remove_white_spaces
    remove_prefix

    valid_address_format?
  end

  def remove_white_spaces
    @long_url = @long_url.downcase.gsub(' ', '')
  end

  def remove_prefix
    ['www.', 'https://', 'http://'].each do |s|
      @long_url = @long_url.gsub(s, '')
    end
  end

  def valid_address_format?
    @long_url.match(/^[0-9a-z]+.\.[a-z]+$/)
  end
end