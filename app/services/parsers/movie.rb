module Parsers
  module Movie
    EXLUDED_KEYS = %i[response ratings type]

    def parse(http_object)
      if http_object["Response"] == "False"
        log_error(http_object["Error"])
        return
      end

      http_object.transform_keys { |k| k.downcase.to_sym }.except!(*EXLUDED_KEYS)
    end

    def log_error(error)
      Rails.logger.warn error
    end
  end
end
