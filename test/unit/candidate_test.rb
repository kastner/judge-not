require 'test_helper'

class CaniddateTest < ActiveSupport::TestCase
  describe "A new candidate" do
    before do
      @candidate = Candidate.find_by_name("Sally")
    end

    it "should have votes" do
      @candidate.votes.size.should_not == 0
    end
    
    it "should know it's average position" do
      @candidate.votes.average(:position).to_f.should be(2.5) # pos: 3 and pos: 2
    end
  end
end
