require 'httparty'
require 'dotenv'
require_relative './parsers/movie'
Dotenv.load

module Services
  class GetMovie
    include Services::Parsers::Movie
    attr_reader :base_uri

    def initialize
      @base_uri = "http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&"
    end

    def by_title(title)
      parse(HTTParty.get("#{@base_uri}t=#{title}"))
    end

    def by_id(id)
      parse(HTTParty.get("#{@base_uri}i=#{id}"))
    end

  end
end
