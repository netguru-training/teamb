class TeamsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create, :delete]
  before_action :authenticate_admin!, only: [:new, :create, :delete]

  expose(:team) { Team.new }

  def new

  end

  def create
    team = Team.new(team_params)

    if team.save
      render 'new', notice: "Team was succesfully created."
    else
      render 'new', notice: "Team could not be created."
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
