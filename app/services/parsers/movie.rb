module Parsers
  module Movie

    EXLUDED_KEYS = %i(response ratings type)

    def parse(http_object)
      http_object.transform_keys { |k| k.downcase.to_sym }.except!(*EXLUDED_KEYS)
    end

  end
end

