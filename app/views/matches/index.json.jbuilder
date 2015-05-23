json.array!(@matches) do |match|
  json.extract! match, :id, :team_a_id, :team_b_id, :date, :team_a_goals, :team_b_goals
  json.url match_url(match, format: :json)
end
