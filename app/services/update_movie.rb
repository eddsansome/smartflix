# frozen_string_literal: true

module UpdateMovie
  class Action < ApplicationService
    def initialize(title, model = Movie)
      @title = title
      @params = GetMovie::ByTitle.call(title)
      @model = model
    end

    def call
      return if params.nil?

      model.update!(params.merge(slug: slug))
    end

    private

    attr_reader :params, :title, :model

    def slug
      Slug::FromParams.call(params)
    end
  end
end
