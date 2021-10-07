# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    movies = Movie.all

    render json: movies
  end

  def show
    @movie = Movie.find_by_slug(slug).first

    if @movie
      render :show
    else
      CreateMovieWorker.perform_async(params[:title])
      render json: { error: 'Sorry, not found - but we are adding more movies everyday!' }.to_json,
             status: :not_found
    end
  end

  private

  # this could be in a better place
  def slug
    Utils::Slug::FromParams.call(params)
  end
end
