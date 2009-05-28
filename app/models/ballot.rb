class Ballot < ActiveRecord::Base
  belongs_to :judge
  belongs_to :round
  has_many :votes
  has_many :candidates, :through => :votes
  
  def submit_votes(candidates)
    votes.map(&:destroy)
    candidates.each_with_index do |candidate_id, index|
      votes.create(:candidate_id => candidate_id, :position => index+1, :round => round)
    end
  end
end
