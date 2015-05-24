class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :team_a_goals
      t.integer :team_b_goals

      t.timestamps null: false
    end
  end
end
