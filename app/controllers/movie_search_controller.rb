class MovieSearchController < ApplicationController
  def search
    flash[:notice] = 'Try refreshing if movie cannot be found!'
    redirect_to controller: 'movies', action: 'show', title: search_params[:query]
  end

  private

  def search_params
    params.permit(:query)
  end
end
