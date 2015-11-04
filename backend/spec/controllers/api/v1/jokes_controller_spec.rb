require 'rails_helper'
require 'pry'

RSpec.describe Api::V1::JokesController, :type => :controller do
  describe "GET /jokes" do
    it "returns all jokes" do

      joke_1 = FactoryGirl.create(:joke)
      joke_2 = FactoryGirl.create(:joke)
      joke_3 = FactoryGirl.create(:joke)

      jokes = [joke_1, joke_2, joke_3]
      setups = jokes.map { |m| m["setup"]}

      get :index

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      gathered_setups = body["data"].map { |m| m["attributes"]["setup"] }

      expect(setups).to match_array(gathered_setups)
    end
  end

  describe "GET #show" do
    it "returns a single joke" do
      joke = FactoryGirl.create(:joke)

      get :show, id: joke.id

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["data"]["attributes"]["punchline"]).to eq joke.punchline
    end
  end

  pending describe "POST #create" do
    it "creates a new joke" do
      joke = FactoryGirl.build(:joke)

      joke_attr = {
        setup: joke.setup,
        punchline: joke.punchline
      }
      # request_headers = {
      #   "Accept" => "application/vnd.api+json",
      #   "Content-Type" => "application/vnd.api+json"
      # }

      post :create, joke: joke_attr

      expect(response.status).to eq 201
      expect(Joke.all.count).to eq 1
    end
  end
end
