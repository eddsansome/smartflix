module Writers
    module BatchCreateWriters
      class Action < ApplicationService
        def initialize(names, model = Writer)
          @names = names.split(", ")
          @model = model
        end
  
        def call
            writers = []
            names.each {|name| writers << create_writer(name)}
            writers
        end
  
        private

        def create_writer(name)
          writer = model.find_or_create_by!(name: name)
        end
  
        attr_reader :model, :names, :movie
      end
    end
  end