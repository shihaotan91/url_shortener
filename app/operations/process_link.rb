# frozen_string_literal: true

class ProcessLink
  def initialize(link)
    @link = link
  end

  def call
    validate_long_url
    return if @link.errors.present?

    sanitize_and_generate_fields
  end

  def validate_long_url
    @link.errors.add(:long_url, 'Unable to shortern invalid url') unless LongUrlValidator.new(@link.long_url).valid?
  end

  def sanitize_and_generate_fields
    sanitize_long_url
    generate_salt
    generate_short_url
  end

  def sanitize_long_url
    @link.long_url = LongUrlSanitizer.new(@link.long_url).sanitize
  end

  def generate_salt
    @link.salt = SecureRandom.hex(5)
  end

  def generate_short_url
    message = "#{@link.long_url}_#{@link.salt}"
    @link.short_url = ShortUrlGenerator.new(message).generate
  end
end
