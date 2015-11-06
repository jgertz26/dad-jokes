class AddRatingToJokes < ActiveRecord::Migration
  def change
    add_column :jokes, :rating, :integer
  end
end
