# frozen_string_literal: true

module Movies
  module Associations
    class Action < ApplicationService
      def initialize(entities, movie, join)
        @entities = entities
        @movie = movie
        @join = join
        @entity_name = join.to_s.underscore.split('_').last
      end

      def call
        entities.each { |entity| create_join(entity) }
      end

      private

      def create_join(entity)
        params = {}
        params[entity_name] = entity
        params['movie'] = movie
        join.create!(params)
      end

      attr_reader :entities, :movie, :join, :entity_name
    end
  end
end
