# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    # making an edit
    title_slug = Slug::FromParams.call(params)
    @movie = Movie.where(slug: title_slug).first

    if @movie
      render json: @movie
    else
      CreateMovieWorker.perform_async(params[:title])
      render json: { error: 'Sorry, not found - but we are adding more movies everyday!' }.to_json,
             status: :not_found
    end
  end
end
