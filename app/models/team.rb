class Team < ActiveRecord::Base
  validates_uniqueness_of :name, message: "Team already exists."
  validates_presence_of :name, message: "Team name was not given."

  def matches 
    Match.with_team(self.id)
  end
end
