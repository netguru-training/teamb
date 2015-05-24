class MatchDecorator < Draper::Decorator
  delegate_all

  def teams
    "#{object.team_a.name} vs #{object.team_b.name}"
  end

end
