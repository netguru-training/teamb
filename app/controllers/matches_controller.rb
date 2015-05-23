class MatchesController < ApplicationController

  expose(:all_teams) { Team.all}
  expose(:match)
  expose(:matches)

  # GET /matches
  # GET /matches.json
  def index
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    binding.pry

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

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
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

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def provide_results

  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:team_a_id, :team_b_id, :date, :team_a_goals, :team_b_goals)
    end
end
