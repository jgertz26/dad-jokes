class Joke < ActiveRecord::Base
  validates :setup, :punchline, presence: true

  validates :setup, length: { maximum: 250 }
  validates :punchline, length: { maximum: 100 }
end
