require 'rails_helper'

RSpec.describe Api::V1::JokesController do

  before do
    request.headers["Content-Type"] = "application/vnd.api+json"
    request.accept = "application/vnd.api+json"
  end

  describe "GET /jokes" do
    it "returns all jokes" do

      jokes = FactoryGirl.create_list(:joke, 3)

      get :index

      expect(response.status).to eq 200

      jokes_array = []

      jokes.each { |joke| jokes_array << joke_attributes(joke) }

      expected_output = {"data" => jokes_array}

      body = JSON.parse(response.body)
      expect(body).to eq(expected_output)
    end
  end

  describe "GET #show" do
    it "returns a single joke" do
      joke = FactoryGirl.create(:joke)

      get :show, id: joke.id

      expect(response.status).to eq 200

      expected_output = { "data" => joke_attributes(joke) }

      body = JSON.parse(response.body)
      expect(body).to eq expected_output
    end
  end

  pending describe "POST #create" do
    it "creates a new joke" do
      joke = FactoryGirl.build(:joke)

      joke_attr = {
        "setup" => joke.setup,
        "punchline" => joke.punchline,
        "rating" => joke.rating
      }

      expected_output = { "data" => joke_attr }
      post :create, expected_output
      binding.pry
      expect(response.status).to eq 201
      expect(Joke.all.count).to eq 1
    end
  end
end

def joke_attributes(joke)
  joke_attr = {}
  joke_attr["id"] = "#{joke.id}"
  joke_attr["type"] = "jokes"
  joke_attr["links"] = {"self" => "http://test.host/api/v1/jokes/#{joke.id}"}
  joke_attr["attributes"] = {
    "setup" => joke.setup,
    "punchline" => joke.punchline,
    "rating" => joke.rating
  }

  joke_attr
end
