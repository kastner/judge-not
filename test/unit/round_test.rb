require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  context "a round with candidates" do
    before do
      @round = rounds(:round_zero)
    end
    
    it "should have candidates" do
      @round.candidates.should include(candidates(:bob), candidates(:dave))
    end
    
    it "should not have some canidates" do
      @round.candidates.should exclude(candidates(:larry))
    end
  end
  
  context "a new round" do
    it "should not be open if another is open" do
      r = Round.new(:note => "I should break", :open => true)
      r.should_not satisfy(lambda {|r| r.valid?})
    end
  end
  
  describe "A round with votes" do
    it "should order by vote average" do
      sorted_candidates = rounds(:round_zero).sorted_candidates
      # raise sorted_candidates.map {|c| "#{c.name}/#{c.average_rank_for_round(rounds(:round_zero).id)}"}.join(" / ")
      sorted_candidates.should == [
        candidates(:dave),
        candidates(:sally),
        candidates(:bob)
      ]
    end
    
    it "should reorder with different votes" do
      ballots(:one).submit_votes([
        candidates(:bob).id,
        candidates(:dave).id,
        candidates(:sally).id
      ])
      
      ballots(:two).submit_votes([
        candidates(:bob).id,
        candidates(:dave).id,
        candidates(:sally).id
      ])

      sorted_candidates = rounds(:round_zero).sorted_candidates
      # raise sorted_candidates.map {|c| "#{c.name}/#{c.average_rank_for_round(rounds(:round_zero).id)}"}.join(" / ")
      sorted_candidates.should == [
        candidates(:bob),
        candidates(:dave),
        candidates(:sally)
      ]      
    end
  end
end
