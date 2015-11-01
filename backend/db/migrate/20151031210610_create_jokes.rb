class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :setup, null: false
      t.string :punchline, null: false
    end
  end
end
