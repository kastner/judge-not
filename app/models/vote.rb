class Vote < ActiveRecord::Base
  belongs_to :ballot
  has_one :judge, :through => :ballot
  belongs_to :contestant
  
  validates_presence_of :position
  validates_uniqueness_of :position, :scope => [:ballot_id, :contestant_id]
end
