module Utils
  module Slug
    class FromParams < ApplicationService
      def initialize(params)
        @params = params
      end

      def call
        params[:title].titleize.gsub(' ', '').underscore
      end

      private

      attr_reader :params
    end
  end
end
