class CandidatesController < ApplicationController
  before_filter :login_required
  before_filter :admin_required, :except => [:show, :index]
  
  def index
    @candidates = Candidate.find(:all, :order => :name)
  end

  def new
    @candidate = Candidate.new
  end
  
  def edit
  end

  def show
  end

  def create
    @candidate = Candidate.new(params[:candidate])
    if @candidate.save
      flash[:notice] = "Candidate saved"
      redirect_to new_candidate_url
    else
      render :action => :new
    end
  end
  
  def update
  end
end
