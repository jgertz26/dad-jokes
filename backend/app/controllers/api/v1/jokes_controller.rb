class Api::V1::JokesController < ApplicationController
  def index
    @jokes = Joke.all
    render json: @jokes
  end

  def show
    @joke = Joke.find(params[:id])
    render json: @joke
  end
end
