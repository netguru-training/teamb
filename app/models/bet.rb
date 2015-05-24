class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates_presence_of :user, :match
  validate :match_unplayed

  def resolve
    points = -1
    points = 2 if match.winner == winner
    points = 5 if team_a_goals == match.team_a_goals && team_b_goals == match.team_b_goals
    user.points += points
    user.save
  end

  def winner
    return team_a if team_a_goals > team_b_goals
    return team_b if team_b_goals > team_a_goals
    return "draw" if team_a_goals == team_b_goals
  end

  private

  def match_unplayed
    self.match.unplayed?
  end

end
