require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  describe "votes" do
    it "should have 3 votes on the first ballot" do
      ballots(:one).votes.size.should == 3
    end
  end
end
