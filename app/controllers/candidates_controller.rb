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
      respond_to do |format|
        format.html do
          flash[:notice] = "Candidate saved"
          redirect_to new_candidate_url
        end
        format.js do
          render :text => <<-JS
            $("#new_candidate input[type='text'], #new_candidate textarea").val('');
            $('<p>Added #{@candidate.name}</p>').appendTo('#message').fadeTo(1000,1).fadeOut('slow');
            $("#new_candidate input[type='text']:first").focus();
          JS
        end
      end
    else
      render :action => :new
    end
  end
  
  def update
  end
end
