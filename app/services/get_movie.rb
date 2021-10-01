# frozen_string_literal: true

require 'httparty'
require 'dotenv'
Dotenv.load

module GetMovie
  BASE_URI = "http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&"
  class ByTitle < ApplicationService
    include Parsers::Movie

    def initialize(title)
      @title = title
    end

    def call
      http_object = HTTParty.get("#{BASE_URI}t=#{@title}")
      puts "*" * 100
      puts http_object
      if http_object['Response'] == 'False'
        log_error(http_object['Error'])
        return
      end
      puts "*" * 100
      puts http_object
      parse(http_object)
    end

    def log_error(error)
      Rails.logger.warn "[#{Time.now}] WARNING: #{@title}: #{error}"
    end
  end
end
