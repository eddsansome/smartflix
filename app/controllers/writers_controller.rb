class WritersController < ApplicationController
  def show
    @writer = Writer.find(params[:id])
  end
end
