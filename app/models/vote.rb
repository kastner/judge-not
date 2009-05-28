class Vote < ActiveRecord::Base
  belongs_to :ballot
  has_one :judge, :through => :ballot
  belongs_to :candidate
  belongs_to :round
  
  validates_presence_of :position, :round_id, :ballot_id
  validates_uniqueness_of :position, :scope => [:ballot_id, :candidate_id]
  validates_uniqueness_of :candidate_id, :scope => :ballot_id
end
