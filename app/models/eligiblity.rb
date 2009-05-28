class Eligiblity < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :round
  
  validates_uniqueness_of :candidate_id, :scope => :round_id
end
