# frozen_string_literal: true

module Movies
  module CreateMovie
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
          model.create!(params.merge(slug: slug, director: director))
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
        raise 'wat' if names.nil?

        Directors::CreateDirector::Action.call(names.split(',').first)
      end
    end
  end
end
