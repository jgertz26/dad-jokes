class Api::V1::JokesController < ApplicationController
  def index
    @jokes = Joke.all
    render json: @jokes
  end

  def show
    @joke = Joke.find(params[:id])
    render json: @joke
  end

  def create
    binding.pry
    joke = Joke.new(create_joke_params)

    if joke.save
      render json: joke,
        status: :created,
        location: [:api, :v1, joke]
    else

      render json: { errors: joke.errors }, status: :unprocessable_entity
    end
  end

  private

  def create_joke_params
    params.require(:joke).permit(:setup, :punchline)
  end
end
