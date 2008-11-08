require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  context "a round with candidates" do
    before do
      @round = rounds(:round_one)
    end
    
    it "should have candidates" do
      @round.candidates.should include(candidates(:bob), candidates(:dave))
    end
    
    it "should not have some canidates" do
      @round.candidates.should exclude(candidates(:sally))
    end
  end
  
  context "a new round" do
    it "should not be open if another is open" do
      r = Round.new(:note => "I should break", :open => true)
      r.should_not satisfy(lambda {|r| r.valid?})
    end
  end
end
