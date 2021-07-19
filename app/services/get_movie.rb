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
      parse(HTTParty.get("#{BASE_URI}t=#{@title}"))
    end
  end
end
