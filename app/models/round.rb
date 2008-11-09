class Round < ActiveRecord::Base
  has_many :eligiblities
  has_many :candidates, :through => :eligiblities
  
  validates_uniqueness_of :open, :unless => lambda { |r| r.open == false }
  
  def self.open
    find(:first, :conditions => { :open => true} )
  end
end
