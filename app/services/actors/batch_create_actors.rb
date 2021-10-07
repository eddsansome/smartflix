module Actors
    module BatchCreateActors
      class Action < ApplicationService
        def initialize(names, model = Actor)
          @names = names.split(", ")
          @model = model
        end
  
        def call
            actors = []
            names.each {|name| actors << create_actor(name)}
            actors
        end
  
        private

        def create_actor(name)
          actor = model.find_or_create_by!(name: name)
        end
  
        attr_reader :model, :names, :movie
      end
    end
  end