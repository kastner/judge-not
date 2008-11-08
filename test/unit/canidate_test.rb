require 'test_helper'

class CanidateTest < ActiveSupport::TestCase
  describe "A new User" do
    before do
      @canidate = Canidate.first
      require 'ruby-debug'
      debugger
    end

    it "should have votes" do
      @canidate.votes.size.should_not == 0
    end
    
    it "should know it's average position" do
      @canidate.votes.average(:position).should be(3)
    end
  end
end
