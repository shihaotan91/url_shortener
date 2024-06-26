# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

DOMAIN_LIST = 'https://data.iana.org/TLD/tlds-alpha-by-domain.txt'

domain_list = URI.parse(DOMAIN_LIST).open.as_json
domain_list.each do |domain|
  next unless domain.match(/^[a-zA-Z]+$/)

  Domain.find_or_create_by!(name: domain.downcase.strip)
end
