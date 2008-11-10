class Round < ActiveRecord::Base
  has_many :eligiblities
  has_many :votes
  has_many :candidates, :through => :eligiblities
  
  validates_uniqueness_of :open, :unless => lambda { |r| r.open == false }
  
  def self.open
    find(:first, :conditions => { :open => true} )
  end
  
  def sorted_candidates
    candidates.sort { |a,b| a.average_rank_for_round(id).to_f <=> b.average_rank_for_round(id).to_f  }
  end
end
