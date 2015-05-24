json.array!(bets) do |bet|
  json.extract! bet, :id, :user_id, :match_id, :team_a_goals, :team_b_goals
  json.url bet_url(bet, format: :json)
end
