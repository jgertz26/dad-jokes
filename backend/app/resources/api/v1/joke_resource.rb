class Api::V1::JokeResource < JSONAPI::Resource
  attributes :setup, :punchline, :rating
end
