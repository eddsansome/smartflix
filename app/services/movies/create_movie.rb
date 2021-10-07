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

        # this is a bit much
        ActiveRecord::Base.transaction do
          director = create_director(params[:director])
          actors = create_actors(params[:actors])
          writers = create_writers(params[:writer])

          remove_keys_from_params([:actors, :writer])

          movie = model.create!(params.merge(slug: slug, director: director))
          add_associations_to_movie(actors, movie, MovieActor)
          add_associations_to_movie(writers, movie, MovieWriter)
        end
      end

      private

      attr_reader :params, :title, :model

      def remove_keys_from_params(args)
        params.except! *args
      end

      def slug
        Utils::Slug::FromParams.call(params)
      end

      def create_director(names)
        raise InvalidParams if names.nil?

        Directors::CreateDirector::Action.call(names.split(',').first)
      end

      def create_actors(names)
        raise InvalidParams if names.nil?

        Entities::BatchCreate::Action.call(names, Actor)
      end

      def create_writers(names)
        raise InvalidParams if names.nil?

        Entities::BatchCreate::Action.call(names, Writer)
      end

      def add_associations_to_movie(entities, movie, join)
        Movies::Associations::Action.call(entities, movie, join)
      end
    end
  end
end
