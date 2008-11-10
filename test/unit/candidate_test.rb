require 'test_helper'

class CaniddateTest < ActiveSupport::TestCase
  describe "A candidate" do
    before do
      @candidate = Candidate.find_by_name("Sally")
    end

    it "should have votes" do
      @candidate.votes.size.should_not == 0
    end
    
    it "should know it's average position" do
      @candidate.votes.average(:position).to_f.should be_close(1.6666) # pos: 2 and pos: 2
    end
    
    it "should know it's average position in the context of a single round" do
      @candidate.average_rank_for_round(rounds(:round_zero).id).should == 2.0
    end
  end
  
  describe "another canidate" do
    it "should have it's average pos for a round" do
      candidates(:dave).average_rank_for_round(rounds(:round_zero).id).should == 1.0
    end
  end
end
