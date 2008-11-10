require 'test_helper'

class BallotTest < ActiveSupport::TestCase
  describe "A group of votes" do
    before do
      @ballot = ballots(:one)
    end
    
    it "should not change the count" do
      assert_no_difference 'Vote.count' do
        @ballot.submit_votes([
          candidates(:bob).id,
          candidates(:dave).id,
          candidates(:sally).id
        ])
      end
    end
  end
end
