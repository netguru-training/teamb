class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :team_a_id
      t.integer :team_b_id
      t.datetime :date
      t.integer :team_a_goals
      t.integer :team_b_goals

      t.timestamps null: false
    end
  end
end
