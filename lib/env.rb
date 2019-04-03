require_relative "web_scraper/version"
require_relative 'web_scraper/library'
require_relative 'web_scraper/cli'

require 'open-uri'
require 'json'

# This should be placed in a local-only env file
ENV['NEWS_API_TOKEN'] = '2beb575ba8e64bc5853a63e71e2aa15f'
