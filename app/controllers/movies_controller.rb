# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    # making an edit
    title = params[:title].humanize.titleize
    @movie = Movie.find_by(title: title)

    if @movie
      render json: @movie
    else
      CreateMovieWorker.perform_async(title)
      render json: { error: 'Sorry, not found - but we are adding more movies everyday!' }.to_json,
             status: :not_found
    end
  end
end
