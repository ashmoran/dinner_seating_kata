require 'spec_helper'
require_relative '../../lib/seating_arrangement'

describe SeatingArrangement do
  subject(:arrangement) { described_class.new([1, 3, 2, 4]) }

  it "is Enumerable" do
    expect(arrangement.map { |guest_number| guest_number - 1 }).to be == [
      0, 2, 1, 3
    ]
  end

  describe "#to_a" do
    it "returns an array" do
      expect(arrangement.to_a).to be_an(Array)
    end

    it "contains the guest number sequence in order" do
      # We don't need to be this strict, but I won't support matching
      # rotated versions of the arrangement until there's a need
      expect(arrangement.to_a).to be == [1, 3, 2, 4]
    end

    it "doesn't leak internal state references" do
      arrangement.to_a[0] = 666
      expect(arrangement.to_a[0]).to be == 1
    end
  end

  context "one guest" do
    # Interesting, is a person left or right of themself?
  end

  context "two guests" do
    subject(:arrangement) { described_class.new([3, 7]) }

    specify {
      expect(arrangement.left_of_guest(3)).to be == 7
    }

    specify {
      expect(arrangement.right_of_guest(3)).to be == 7
    }

    specify {
      expect(arrangement.left_of_guest(7)).to be == 3
    }

    specify {
      expect(arrangement.right_of_guest(7)).to be == 3
    }
  end
end