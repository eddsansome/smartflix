module Entities
  module BatchCreate
    class Action < ApplicationService
      def initialize(names, model)
        @names = names.split(', ')
        @model = model
      end

      def call
        entities = []
        names.each { |name| entities << create_entity(name) }
        entities
      end

      private

      def create_entity(name)
        model.find_or_create_by!(name: name)
      end

      attr_reader :model, :names
    end
  end
end
