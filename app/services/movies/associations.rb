# frozen_string_literal: true

module Movies
    module Associations
      class Action < ApplicationService
        def initialize(entities, movie, join)
            @entities = entities
            @movie = movie
            @join = join
            @entity_name = join.to_s.underscore.split("_").last
        end
  
        def call
            entities.each do |entity|
            params = {}
            params[entity_name] = entity
            params["movie"] = movie
                join.create(params)
            end
        end
  
        private
  
        attr_reader :entities, :movie, :join, :entity_name
  
      end
    end
  end
  