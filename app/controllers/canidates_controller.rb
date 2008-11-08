class CanidatesController < ApplicationController
  before_filter :login_required
  before_filter :admin_required, :except => [:show, :index]
  
  def index
    @canidates = Canidate.find(:all, :order => :name)
  end

  def new
    @canidate = Canidate.new
  end
  
  def edit
  end

  def show
  end

  def create
    @canidate = Canidate.new(params[:canidate])
    if @canidate.save
      flash[:notice] = "User saved"
      redirect_to new_canidate_url
    else
      render :action => :new
    end
  end
  
  def update
  end
end
