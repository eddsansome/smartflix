module Services
  module Parsers
    module Movie

    class MovieParseError < StandardError
    end
    Movie = Struct.new(
      :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
      :language, :country, :awards, :poster, :metascore, :imdbrating, :imdbvotes, :imdbid,
      :type, :dvd, :boxoffice, :production, :website, keyword_init: true
    )
    def parse(http_object)
      movie = http_object.transform_keys { |k| k.downcase.to_sym }

      begin
      Movie.new(
        title: movie[:title],
        year: movie[:year].to_i,
        rated: movie[:rated],
        released: movie[:released],
        runtime: movie[:runtime],
        genre: movie[:genre],
        director: movie[:director],
        writer: movie[:writer],
        actors: movie[:actors].split(","),
        plot: movie[:plot],
        language: movie[:language],
        country: movie[:country],
        awards: movie[:awards],
        poster: movie[:poster],
        metascore: movie[:metascore].to_f,
        imdbrating: movie[:imdbrating].to_f,
        imdbvotes: movie[:imdbvotes],
        imdbid: movie[:imdbid],
        type: movie[:type],
        dvd: movie[:dvd],
        boxoffice: movie[:boxoffice],
        production: movie[:production],
        website: movie[:website],
      )
      rescue StandardError
        raise MovieParseError
      end
    end
    end
  end
end

