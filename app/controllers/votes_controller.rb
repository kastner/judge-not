class VotesController < ApplicationController
  before_filter :login_required
  
  def new
  end

  def show
    @round = Round.open
    if @round
      unless @candidates = current_judge.ballot_for_round(Round.open).candidates
        @candidates = @round.candidates  
      end
    end
    @candidates = [] unless @candidates
  end

  def edit
    @round = Round.open
    ballot = current_judge.ballot_for_round(@round)
  end

  def create
    ballot = current_judge.ballot_for_round(Round.open)
    ballot.submit_votes(params[:candidate])
    render :text => %Q{show_then_fade("Updated")}
  end
  
  def update
  end
end
