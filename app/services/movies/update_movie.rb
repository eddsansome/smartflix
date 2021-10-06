# frozen_string_literal: true

module Movies
  module UpdateMovie
    class Action < ApplicationService
      def initialize(title, model = Movie)
        @title = title
        @params = Http::GetMovie::ByTitle.call(title)
        @model = model
      end

      def call
        return if params.nil?

        # TODO: tidy this up, we need to remove the director as this will cause 
        # an ActiveRecord::AssociationTypeMismatch
        # but there is probably a nicer way of handling this (perhaps checking if the director
        # needs to be updated)

        params.except! :director

        model.update!(params.merge(slug: slug))
      end

      private

      attr_reader :params, :title, :model

      def slug
        Slug::FromParams.call(params)
      end
    end
  end
end
