class Candidate < ActiveRecord::Base
  has_many :votes
  
  validates_presence_of :name
  
  def average_rank_for_round(round_id)
    votes.average(:position, :conditions => {:round_id => round_id})
  end
end
