# frozen_string_literal: true

module Movies
  module CreateMovie
    class InvalidParams < StandardError; end
    class Action < ApplicationService
      def initialize(title, model = Movie)
        @title = title
        @params = Http::GetMovie::ByTitle.call(title)
        @model = model
      end

      def call
        return if params.nil?

        ActiveRecord::Base.transaction do
          director = create_director(params[:director])
          actors = create_actors(params[:actors])
          params.except! :actors
          movie = model.create!(params.merge(slug: slug, director: director))
          add_associations_to_movie(actors, movie, MovieActor) 
        end
      end

      private

      attr_reader :params, :title, :model

      def slug
        Utils::Slug::FromParams.call(params)
      end

      # could be more than one director? hmm lets just stop at one for now
      # pretty tightly coupled :sweaty
      def create_director(names)
        raise InvalidParams if names.nil?

        Directors::CreateDirector::Action.call(names.split(',').first)
      end

      def create_actors(names)
        raise InvalidParams if names.nil?

        Actors::BatchCreateActors::Action.call(names)
      end

      def add_associations_to_movie(entities, movie, join)
        Movies::Associations::Action.call(entities, movie, join)
      end
    end
  end
end
