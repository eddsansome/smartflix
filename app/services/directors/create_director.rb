# frozen_string_literal: true

module Directors
  module CreateDirector
    class Action < ApplicationService
      def initialize(name, model = Director)
        @name = name
        @model = model
      end

      def call
        model.find_or_create_by!(name: name)
      end

      private

      attr_reader :model, :name
    end
  end
end
