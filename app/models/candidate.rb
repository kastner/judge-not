class Candidate < ActiveRecord::Base
  has_many :votes
  
  validates_presence_of :name, :bio
end
