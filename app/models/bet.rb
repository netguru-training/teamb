class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates_presence_of :user, :match
  validate :match_unplayed

  private

  def match_unplayed
    self.match.unplayed?
  end

end
