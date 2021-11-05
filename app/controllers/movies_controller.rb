# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    # we should change this to paginate
    @movies = Movie.all

    render json: movies
  end

  def show
    @movie = Movie.find_by(slug: slug)

    if @movie
      render :show
    else
      @title = params[:title]
      CreateMovieWorker.perform_async(@title)
      render :movie_not_found
    end
  end

  private

  # this could be in a better place
  def slug
    Utils::Slug::FromParams.call(params)
  end
end
