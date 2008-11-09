class VotesController < ApplicationController
  before_filter :login_required
  
  def new
  end

  def show
    @round = Round.open
    @candidates = (@round) ? @round.candidates : []
  end

  def edit
  end

  def create
  end
  
  def update
  end
end
