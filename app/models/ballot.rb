class Ballot < ActiveRecord::Base
  belongs_to :judge
  has_many :votes
  has_many :canidates, :through => :votes
end
