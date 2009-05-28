require 'test_helper'

class EligiblityTest < ActiveSupport::TestCase
  context "weird" do
    it "dunno" do
      rounds(:round_zero).candidates.should include(
        candidates(:dave),
        candidates(:bob),
        candidates(:sally)
      )
    end
    
    it "shouldn't include the others" do
      rounds(:round_zero).candidates.should_not include(
        candidates(:larry),
        candidates(:don)
      )
    end
  end
end
