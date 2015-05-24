class Match < ActiveRecord::Base
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"
  has_many :bets

  validates_presence_of :team_a
  validates_presence_of :team_b
  validate :teams_unequal
  validates_presence_of :date

  scope :with_team, ->(team_id) { where("team_a_id=? OR team_b_id=?", team_id, team_id) }

  scope :history, -> { where("DATE(date) <= ?", Date.today) }

  scope :history_played, -> { where("DATE(date) <= ? AND team_a_goals IS NOT NULL", Date.today) }

  def unplayed?
    self.date > Time.now
  end

  private


  def teams_unequal
    return team_a != team_b
  end
end
