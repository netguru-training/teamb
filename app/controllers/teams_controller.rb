class TeamsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]

  expose(:teams)
  expose(:team)

  def index
  end

  def new
  end

  def edit

  end

  def create
    team = Team.new(team_params)

    if team.save
      render 'new', notice: "Team was succesfully created."
    else
      render 'new', notice: "Team could not be created."
    end
  end

  def update
    notice
    binding.pry
    if team.update(team_params)
      notice = "Team updated successfully."
    else
      notice = "Team could not be updated."
    end
    render action: "index", notice: notice
  end

  def destroy
    notice
    if team.destroy
      notice = "Team deleted successfully."
    else
      notice = "Team could not be deleted."
    end
    render action: "index", notice: notice
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
