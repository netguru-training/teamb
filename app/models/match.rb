class Match < ActiveRecord::Base
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"

  scope :with_team, ->(team_id) { where("team_a_id=? OR team_b_id=?", team_id, team_id) }
end
