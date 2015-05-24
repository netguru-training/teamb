class Match < ActiveRecord::Base
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"
  has_many :bets

  validates_presence_of :team_a
  validates_presence_of :team_b
  validate :teams_unequal
  validates_presence_of :date
  validate :set_goals_only_for_played_match

  after_update :set_points_for_users

  scope :with_team, ->(team_id) { where("team_a_id=? OR team_b_id=?", team_id, team_id) }

  scope :history, -> { where("DATE(date) <= ?", Date.today) }

  scope :history_played, -> { where("DATE(date) <= ? AND team_a_goals IS NOT NULL", Date.today) }

  def unplayed?
    !played?
  end

  def played?
    date < Time.now if date
  end

  def winner
    return team_a if team_a_goals > team_b_goals
    return team_b if team_b_goals > team_a_goals
    return "draw" if team_a_goals == team_b_goals
  end

  private

  def set_points_for_users
    bets.each do |bet|
      bet.resolve
    end
  end

  def set_goals_only_for_played_match
    played? if (team_a_goals || team_b_goals)
  end

  def teams_unequal
    return team_a != team_b
  end
end
