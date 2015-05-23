class Team < ActiveRecord::Base
  def matches 
    Match.with_team(self.id)
  end
end
