class BetsController < ApplicationController
  expose(:all_bets) { Bet.all }
  expose(:bet)
  expose(:bets)

  def index
    bets = Bet.all
  end

  def show
  end

  def new
    bet = Bet.new
  end

  def edit
  end

  def create
    bet = Bet.new(bet_params)
    respond_to do |format|
      if bet.save
        format.html { redirect_to  bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location:  bet }
      else
        format.html { render :new }
        format.json { render json:  bet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    bet = Bet.find(params[:id])
    respond_to do |format|
      if bet.update(bet_params)
        format.html { redirect_to  bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location:  bet }
      else
        format.html { render :edit }
        format.json { render json:  bet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def bet_params
      params.require(:bet).permit(:user_id, :match_id, :team_a_goals, :team_b_goals)
    end
end
