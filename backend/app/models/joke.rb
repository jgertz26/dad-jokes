class Joke < ActiveRecord::Base
  validates :setup, :punchline, presence: true

  validates :setup, length: { minimum: 1, maximum: 250 }
  validates :punchline, length: { minimum: 1, maximum: 100 }
end
