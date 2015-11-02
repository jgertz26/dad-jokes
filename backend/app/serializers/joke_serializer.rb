class JokeSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :setup, :punchline
end
