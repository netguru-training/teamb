class TeamsController < ApplicationController

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
      flash[:notice] = "Team was succesfully created."
      render 'index'
    else
      flash[:notice] = "Team could not be created."
      render 'index'
    end
  end

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      flash[:notice] = "Team updated successfully."
      render 'index'
    else
      flash[:notice] = "Team could not be updated."
      render 'index'
    end
  end

  def destroy
    if team.destroy
      flash[:notice] = "Team deleted successfully."
      render 'index'
    else
      flash[:notice] = "Team deleted successfully."
      render 'index'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
