class Top50Controller < ApplicationController
  def index
    @movies = TopMovie.all
  end
end
