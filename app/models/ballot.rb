class Ballot < ActiveRecord::Base
  belongs_to :judge
  has_many :votes
  has_many :candidates, :through => :votes
  
  validates_uniqueness_of :candidate_id, :scope => :round_id
end
