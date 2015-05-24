class MatchesController < ApplicationController
  before_action :check_if_match_played, only: [:provide_results, :update]
  before_action :check_if_match_unplayed, only: [:edit]

  expose(:all_teams) { Team.all}
  expose(:match) { Match.find_by(id: params[:id]) || Match.new }
  expose(:matches)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    match = Match.new(match_params)
    respond_to do |format|
      if match.save
        format.html { redirect_to match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: match }
      else
        format.html { render :new }
        format.json { render json: match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    match = Match.find(params[:id])
    respond_to do |format|
      if match.update(match_params)
        format.html { redirect_to match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: match }
      else
        format.html { render :edit }
        format.json { render json: match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def provide_results

  end

  def history
    @matches = Match.history
  end


  private

    def match_params
      params.require(:match).permit(:team_a_id, :team_b_id, :date, :team_a_goals, :team_b_goals)
    end
end
