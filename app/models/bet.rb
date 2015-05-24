class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates_presence_of :user, :match

end
